require 'compare'

def printlocals(s,w)
  x = ""
  s.each_index do |i|
    n = 0;
    while n<s[i].length
      x << "#{w[i][n][s[i][n]]}"
      x << "," if n+1!=s[i].length
      n += 1;
    end
    x << ";"
  end
  x
end

if ARGV.length < 1 then
  puts "LuaDec local parameter guesser"
  puts "Usage: luadecguess [-fg num] [-d] [-f num] [-p num] [-l num] [-s num] [-t type] filename"
  puts
  puts "Options:"
  puts "  -d      : Show debug informations"
  puts "  -p num  : Search for maximum `num' opcodes for local declarations (default: 70)"  
  puts "  -l num  : Search for maximum `num' locals per function (default: 3)"
  puts "  -f num  : Only guess function number `num' (0 based) (default: all)"
  puts "  -s num  : Only take `num' steps then use the best LDS found (default: infinity)"
  puts "  -t type : Only search until the first LDS for which"
  puts "            1: 100% of the lines are the same (default)"
  puts "            2: 100% of the opcodes are the same"
  puts "            3: 75% of the lines are the same"
  puts "            4: 75% of the opcodes are the same"  
  puts "            5: 50% of the lines are the same"
  puts "            6: 50% of the opcodes are the same"    
  puts "            7: 25% of the lines are the same"
  puts "            8: 25% of the opcodes are the same"    
  puts "            9: the script can at least be compiled"
  puts "  -fg num : Fast guess and print useful information for manual corrections"
  puts "            Print out last `num' relevant lines from functions"
else
  $opcodes = 70
  $locals = 5
  $steps = -1
  $type = 0
  $filename = ""
  $functionnum = -1
  $debug = false
  $fast = false
  while ARGV.length > 1
    op = ARGV.shift
    if op.strip.downcase == "-fg" then
      $fast = ARGV.shift.to_i
    elsif op.strip.downcase == "-d" then
      $debug = true
    elsif op.strip.downcase == "-p" then
      $opcodes = ARGV.shift.to_i
    elsif op.strip.downcase == "-l" then
      $locals = ARGV.shift.to_i
    elsif op.strip.downcase == "-s" then
      $steps = ARGV.shift.to_i
    elsif op.strip.downcase == "-t" then
      $type = ARGV.shift.to_i
    elsif op.strip.downcase == "-f" then
      $functionnum = ARGV.shift.to_i
    end
  end
  if $fast then
    $opcodes = 9999 if $opcodes == 70
    $locals = 9999 if $locals == 5
  end
  $filename = ARGV[0]
  disasm = `luadec -dis #{$filename}`;
  functions = [[]]
  fnum = [[]]
  where = []
  regnum = []
  nolocal = []
  local = []
  parameters = []
  declocal = []
  lines = []
  actf = 0;
  disable = false
  disasm.each_line do |line|
    if line =~ /; Function #([0-9]*):/ then
      actf = $1.to_i;
      functions[actf] ||= [];
      disable = false
    elsif line =~ /; Function #[0-9]*\./ then
      disable = true
    elsif line =~ /; #Parameters: *([0-9]*)/ and !disable then
      fnum[actf] = $1.to_i
      declocal[actf] = $1.to_i
      parameters[actf] = $1.to_i
      local[actf] = []
      (0...fnum[actf]).each { |i| local[actf][i] = 0; }      
    elsif line =~ /; Max Stack Size: *([0-9]*)/ and !disable then
      regnum[actf] = $1.to_i
    elsif line =~ /([0-9]*) *\[-\]: *([^ ]*).*; *R([0-9]*)\((.*)\)/ and !disable then
      functions[actf][$3.to_i] ||= []
      functions[actf][$3.to_i] << [:call, [$1.to_i, $2, $4]]
    elsif line =~ /([0-9]*) *\[-\]: *([^ ]*).*; *R([0-9]*) := (.*)/ and !disable then
      if $2!="SELF" then
        functions[actf][$3.to_i] ||= []
        functions[actf][$3.to_i] << [:set, [$1.to_i, $2,$4]]
        where[actf] ||= []
        where[actf][$3.to_i] ||= []
        where[actf][$3.to_i] << $1.to_i
      end
    end
    if line=~ /([0-9]*) *\[-\]/ and !disable then
      lines[actf] ||= []
      lines[actf][$1.to_i] = line.strip
    end
  end

  functions.each_index do |fi|
    func = functions[fi]
    nolocal[fi] ||= []
    func.each_index do |ri|
      func[ri] ||= []
      func[ri].each do |f|
        if f[0]==:call then
          f[1][2].split(",").each do |regs|
            if regs =~ /R([0-9]*)/ then
              nolocal[fi][$1.to_i] = f[1][0];
            end
          end
        elsif f[0]==:set then
          if f[1][1]=~/CALL/ then
            f[1][2] =~ /\((.*)\)/
            $1.split(",").each do |regs|
              if regs =~ /R([0-9]*)/ then
                nolocal[fi][$1.to_i] = f[1][0];
              end
            end
          elsif f[1][1] =~ /CLOSURE/ then
            (0..(ri-1)).each do |i|
              if (local[fi][i].nil?) then
                func[i].each do |num|
                  if num[1][0]<f[1][0] then
                    if declocal[fi]<i then
                      declocal[fi]=i+1
                    end
                    local[fi][i] = num[1][0];
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  local.each_index do |i|
    (0...regnum[i]).each do |k|
      if local[i][k].nil? then
        local[i][k] = $opcodes;
      end
    end
  end

  maxvals = local.dup
  minvals = nolocal.dup

  maxvals.each_index do |i|
    maxvals[i].each_index do |r|
      if where[i].nil? then
        where[i] = []
      end
      if where[i][r].nil? then
        where[i][r] = [0]
      end
      where[i][r].delete_if {|a| a > maxvals[i][r]}
      unless $fast
        where[i][r].delete_if {|a| minvals[i][r] and a < minvals[i][r]}
      end
      orig = where[i][r].dup
      where[i][r] = [0]
      orig.each_index do |ind|
        if orig[ind] and orig[ind+1] then
          if orig[ind]+1!=orig[ind+1] then
            where[i][r] << orig[ind]
          end
        end
        if !orig[ind+1] then
          where[i][r] << orig[ind]
        end
      end
    end
    where[i].delete_if { |a| a==[] }
  end

  selector = []
  smax = []

  where.each_index do |i|
    selector[i] ||= []
    smax[i] ||= []
    p = parameters[i] || 0
    if where[i].length>p+$locals then
      where[i] = where[i][0...(p+$locals)]
    end
    where[i].each_index do |ii|
      smax[i][ii] = where[i][ii].nil? ? 0 : where[i][ii].length
    end
  end

  actf = selector.length-1;
  actf = $functionnum+1 if $functionnum != -1
	
  $stderr.puts where.inspect if $debug

	done = false;
  okselector = selector.dup
  stepcount = 0;
  best = [9999,0,0,10,printlocals(selector,where)]

  if $fast then
    minparams = []
    where.each_index do |func|
      if func==0 then
        puts "Main Block"
      else
        puts "Function ##{func}"
      end
      puts "  Parameters: #{parameters[func]}"
      puts "  Last relevant lines:"
      i = lines[func].length-1
      min = -1;
      while true and i>1
         i -= 1;
         regs = []
         lines[func][i].scan(/R([0-9]*)/).each do |a|
           regs[a[0].to_i] = true
         end
         (parameters[func]..regnum[func]).each do |ii|
           if regs[ii] then            
             min = ii if min==-1
           end
         end
         if i==1 or min!=-1 then break; end
      end
      if i<=0 then
        i=1
      end
      (i-$fast).upto(i) do |iii|
        puts lines[func][iii] if iii>0
      end
      minparams[func] = min
      (0...parameters[func]).each do |i|
        selector[func] ||= []
        selector[func][i] = 0
      end
      (parameters[func]...min).each do |i|
        selector[func] ||= []
        selector[func][i] = where[func][i].length-1
      end
      (selector[func].length-2).downto(0) do |i|
        while where[func][i][selector[func][i]]>where[func][i+1][selector[func][i+1]] 
          selector[func][i] -= 1 
        end
      end
      puts "  Last register: #{min}"
      puts "  Register assignment dump:"
      where[func].each_index do |reg|
        r = where[func][reg]
        print "    R#{reg}: "
        r.each do |rr|
          print rr
          print "," unless rr == r.last
        end
        puts
      end
    end
    selector.each do |s|
      s.replace [] if s.all? { |kk| kk==0 } 
    end
    puts
  else
    while actf>=0
      unless done
        okay = true
        (1...selector[actf].length).each do |x|
          if where[actf][x][selector[actf][x]]<where[actf][x-1][selector[actf][x-1]] then
            okay = false
          end
        end
        if okay then
          stepcount += 1;
          str = printlocals selector,where
          system("luadec -f #{actf} -l #{str} #{$filename} > temp.luatemp")
          ol, sl, so, ch = comparedisasm(actf-1, $filename, "temp.luatemp", false)

          d = ch

          if (ol!=0) then
            best[0] = ol
            type = 9
            save = false          

            if sl>best[1] then
              best[1] = sl
              save = true
            end

            if so>best[2] then
              best[2] = so
              save = true
            end

            percent1 = ((sl.to_f/ol.to_f)*100).to_i
            percent2 = ((so.to_f/ol.to_f)*100).to_i

            if percent1>=100 then
              type = 1            
            elsif percent2>=100 then
              type = 2            
            elsif percent1>=75 then
              type = 3            
            elsif percent2>=75 then
              type = 4            
            elsif percent1>=50 then
              type = 5            
            elsif percent2>=50 then            
              type = 6            
            elsif percent1>=25 then
              type = 7            
            elsif percent2>=50 then
              type = 8
            end

            if type<best[3] then
              best[3] = type
              save = true
            end

            if type<=$type then
              d = false
            end
            if save then
              best[4] = str
              ##### SAVE #####
              okselector = []
              selector.each_index do |i|
                okselector[i] = []
                selector[i].each_index do |ii|
                  okselector[i][ii] = selector[i][ii]
                end
              end
              ##### SAVEEND #####            
            end
          end

          if stepcount==$steps then
            d = false
          end

          $stderr.puts "%04d:   best: %3d %3d %3d %3d %s" % [stepcount,best[0],best[1],best[2],best[3],best[4]] if $debug
          $stderr.puts "%04d: actual: %3d %3d %3d %3d %s" % [stepcount,ol, sl, so, 0, str] if $debug
          
          if !d then
            ##### LOAD #####
            selector = []
            okselector.each_index do |i|
              selector[i] = []
              okselector[i].each_index do |ii|
                selector[i][ii] = okselector[i][ii]
              end
            end                   
            if $functionnum>-1 then
              actf = -1
            else
              actf -= 1;
            end
            stepcount = 0
            best = [9999,0,0,10,best[4]]
            ##### LOADEND #####
            next
          end
        end      
      end
      if actf>=0 then
        n = 0;
        selector[actf][n] ||= -1;
        selector[actf][n] += 1;
        while selector[actf][n] >= smax[actf][n] or (!selector[actf][n+1].nil? and where[actf][n][selector[actf][n]]>where[actf][n+1][selector[actf][n+1]])
          selector[actf][n] = 0;
          n += 1;
          if n>=smax[actf].length then
            ##### LOAD #####
            selector = []
            okselector.each_index do |i|
              selector[i] = []
              okselector[i].each_index do |ii|
                selector[i][ii] = okselector[i][ii]
              end
            end                   
            if $functionnum>-1 then
              actf = -1
            else
              actf -= 1;
            end
            stepcount = 0
            best = [9999,0,0,10,best[4]]
            ##### LOADEND #####
            break;
          else
            selector[actf][n] ||= -1;
            selector[actf][n] += 1;
          end
        end
      end
    end
  end

  puts printlocals(selector,where)
end
