require 'fileutils'

def decompfunc(af,bf,pout)
  change = false
  origlines = 0;
  samelines = 0;
  sameopcode = 0;
  af.each_index do |ai|
    bi = ai;
    origlines += 1;
    if (af[ai] != bf[bi]) and (af[ai] !~ /Defined at line/) and (af[ai] !~ /Original file/) and (af[ai] !~ /; Disassembled:/) then
      print "  1>" if pout
      puts af[ai] if pout
      print "  2>" if pout
      puts bf[bi] if pout
      change = true
      unless bf[bi].nil?
        if af[ai] =~ /\[-\]: ([^ ]*)/ then
          opcode1 = $1
          if bf[bi] =~ /\[-\]: ([^ ]*)/ then
            opcode2 = $1
            if opcode1==opcode2 then
              sameopcode += 1 
            end
          end
        end
      end
    else
      samelines += 1;
      sameopcode += 1;
    end
  end
  if af.length!=bf.length then
    change = true
  end
  return origlines, samelines, sameopcode, change 
end

def comparedisasm(funcin,afile,bfile,pout)
  f = funcin+1
  compiled = false  
  a = `luadec -dis #{afile}`.split("\n")
  b = `luadec -dis #{bfile}`.split("\n")
  origline = 0
  sameline = 0
  sameopcode = 0;
  x = 0;
  change = false
  ai=0;
  bi=0;
  af = []
  bf = []
  if (f==0) then
    maxfunc = 0;
    a.each do |line|
      if line =~ /; Function #([0-9]*):/ then
        if $1.to_i>maxfunc then
          maxfunc = $1.to_i
        end
      end
    end
    while ai<a.length and a[ai] !~ /; Function #/ do
      af << a[ai] if a[ai] =~ /\[-\]:/
      ai+=1;
    end
    while bi<b.length and b[bi] !~ /; Function #/ do
      bf << b[bi] if b[bi] =~ /\[-\]:/
      bi+=1;
    end

    puts "Main block:" if pout
    ol, sl, so, ch = decompfunc(af,bf,pout)
    origline += ol
    sameline += sl
    sameopcode += so
    if pout then
      if ch then
        change = true
        puts "Opcodes in original: #{ol}"
        puts "Same lines in both files: #{sl} #{((sl.to_f/ol.to_f)*100).to_i}%"
        puts "Same opcodes in files: #{so} #{((so.to_f/ol.to_f)*100).to_i}%"        
        puts "Different"
      else
        change = change || ch
        puts "Same"
      end
    else
      change = change || ch
    end

    (1..maxfunc).each do |ff|
      ai=0;
      bi=0;
      af = []
      bf = []
      while ai<a.length and a[ai] !~ /; Function ##{ff}:/ do
        ai+=1;
      end
      while bi<b.length and b[bi] !~ /; Function ##{ff}:/ do
        bi+=1;
      end
      ai+=1
      bi+=1
      while ai<a.length and a[ai] !~ /; Function ##{ff+1}:/ do
        af << a[ai] if a[ai] =~ /\[-\]:/
        ai+=1;
      end
      while bi<b.length and b[bi] !~ /; Function ##{ff+1}:/ do
        bf << b[bi] if b[bi] =~ /\[-\]:/
        bi+=1;
      end

      puts "Function #{ff}:" if pout
      ol, sl, so, ch = decompfunc(af,bf,pout)
      origline += ol
      sameline += sl
      sameopcode += so      
      if pout then
        if ch then
          change = true
          puts "Opcodes in original: #{ol}"          
          puts "Same lines in both files: #{sl} #{((sl.to_f/ol.to_f)*100).to_i}%"
          puts "Same opcodes in files: #{so} #{((so.to_f/ol.to_f)*100).to_i}%"          
          puts "Different"
        else
          change = change || ch
          puts "Same"
        end
      else
        change = change || ch
      end
    end
  else
    while ai<a.length and a[ai] !~ /; Function ##{f}:/ do
      ai+=1;
    end
    while bi<b.length and b[bi] !~ /; Function #1:/ do
      bi+=1;
    end
    ai+=1
    bi+=1
    while ai<a.length and a[ai] !~ /; Function ##{f+1}:/ do
      af << a[ai] if a[ai] =~ /\[-\]:/
      ai+=1;
    end
    while bi<b.length and b[bi] !~ /; Function #0:/ do
      bf << b[bi] if b[bi] =~ /\[-\]:/
      bi+=1;
    end

    puts "Function #{f}:" if pout
    ol, sl, so, ch = decompfunc(af,bf,pout)
    origline += ol
    sameline += sl
    sameopcode += so    
    if pout then
      if ch then
        change = true
        puts "Opcodes in original: #{ol}"
        puts "Same lines in both files: #{sl} #{((sl.to_f/ol.to_f)*100).to_i}%"
        puts "Same opcodes in files: #{so} #{((so.to_f/ol.to_f)*100).to_i}%"
        puts "Different"
      else
        change = change || ch
        puts "Same"
      end
    else
      change = change || ch
    end
  end

  if pout then
    puts
    puts "Global:"
    puts "Opcodes in original: #{origline}"
    puts "Same lines in both files: #{sameline} #{((sameline.to_f/origline.to_f)*100).to_i}%"
    puts "Same opcodes in files: #{sameopcode} #{((sameopcode.to_f/origline.to_f)*100).to_i}%"
  end

  return origline, sameline, sameopcode, change
end

if $0 == __FILE__ then

  if ARGV.length <= 1 then
    puts "Usage: compare {-f fnum} [origfile.luac] [newfile.lua(c)]"
    puts
    puts "Compare will compare the disassembly output of origfile to"
    puts "newfile. If newfile is not compiled it will compile it first"
    puts "If -f is present compare will compare the nth function of origfile"
    puts "with the first function of newfile"
  else
    f = -1
    if ARGV[0]=="-f" then
      ARGV.shift
      f = ARGV.shift.to_i
    end
    comparedisasm(f,ARGV[0],ARGV[1],true)    
  end
end
