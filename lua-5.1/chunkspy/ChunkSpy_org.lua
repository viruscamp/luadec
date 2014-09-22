#!/usr/bin/env lua
--[[-------------------------------------------------------------------

  ChunkSpy.lua
  A Lua 5.1 binary chunk disassembler
  ChunkSpy was inspired by Nick Trout's vmmerge5.lua

  Copyright (c) 2004-2006 Kein-Hong Man <khman@users.sf.net>
  The COPYRIGHT file describes the conditions under which this
  software may be distributed (basically a Lua 5-style license.)

  http://luaforge.net/projects/chunkspy/
  http://www.geocities.com/keinhong/chunkspy.html
  See the ChangeLog for more information.

--]]-------------------------------------------------------------------

--[[-------------------------------------------------------------------
-- Notes:
-- * See 5.0.2/ChunkSpy.lua for script notes and outline
--]]-------------------------------------------------------------------

--[[-------------------------------------------------------------------
-- description and help texts
--]]-------------------------------------------------------------------

title = [[
ChunkSpy: A Lua 5.1 binary chunk disassembler
Version 0.9.8 (20060307)  Copyright (c) 2004-2006 Kein-Hong Man
The COPYRIGHT file describes the conditions under which this
software may be distributed (basically a Lua 5-style license.)
]]
-----------------------------------------------------------------------
USAGE = [[
usage: %s [options] [filenames]

options:
  -h, --help        prints usage information
  --stats           prints some statistical information
  --brief           generate assembly-style brief listing
  --auto            auto detects binary chunk profile
  -o <file>         specify file name to write output listing
  --source <file>   generate listing from a Lua source file
  --rewrite "plat"  generate binary chunk using given profile;
                    use "local" for local binary chunk format
  --run             convert to local format, load and execute
  --test            perform internal tests only
  --sample          generate sample listing only
  --interact        *interactive mode*, output brief listings
  --                stop handling arguments

example:
  >luac myscript.lua
  >%s luac.out myscript.lua -o myscript.lst

* Other configuration settings can be customized in the script
* If source filename is specified, the source listing is merged in
]]
-----------------------------------------------------------------------
interactive_help = [[
Type 'exit' or 'quit' to end the interactive session. 'help' displays
this message. ChunkSpy will attempt to turn anything else into a
binary chunk and process it into an assembly-style listing.
A '\' can be used as a line continuation symbol; this allows multiple
lines to be strung together.
]]

--[[-------------------------------------------------------------------
-- Configuration table
-- * Contains fixed constants, display constants and options, and
--   platform-dependent configuration constants
-----------------------------------------------------------------------
-- Configuration settings of binary chunks to be processed. Such tables
-- may be used to sort of "auto-detect" binary chunks from different
-- platforms. More or less equivalent to the global header.
-- * There is currently only one supported host, "x86 standard"
-- * MAX_STACK is no longer required for decoding RK register indices,
--   instead, the MSB bit in the field is used as a flag (Lua 5.1)
-- * number_type is also used to lookup conversion function, etc.
--]]-------------------------------------------------------------------

CONFIGURATION = {
  ["x86 standard"] = {
    description = "x86 standard (32-bit, little endian, doubles)",
    endianness = 1,             -- 1 = little endian
    size_int = 4,               -- (data type sizes in bytes)
    size_size_t = 4,
    size_Instruction = 4,
    size_lua_Number = 8,        -- this & integral identifies the
    integral = 0,               -- type of lua_Number
    number_type = "double",     -- used for lookups
  },
  ["big endian int"] = {
    description = "(32-bit, big endian, ints)",
    endianness = 0,
    size_int = 4,
    size_size_t = 4,
    size_Instruction = 4,
    size_lua_Number = 4,
    integral = 1,
    number_type = "int",
  },
  -- you can add more platforms here
}

-----------------------------------------------------------------------
-- set the default platform (can override with --auto auto-detection)
-- * both in & out paths use config.* parms, a bit clunky for now
-----------------------------------------------------------------------
config = {}

function SetProfile(profile)
  if profile == "local" then
    -- arrives here only for --rewrite and --run option
    local flag1, flag2 = config.DISPLAY_FLAG, config.AUTO_DETECT
    config.DISPLAY_FLAG, config.AUTO_DETECT = false, true
    local LUA_SAMPLE = string.dump(function() end)
    -- config.* profile parms set in ChunkSpy() call...
    local ok, _ = pcall(ChunkSpy, "", LUA_SAMPLE)
    if not ok then error("error compiling sample to test local profile") end
    config.DISPLAY_FLAG, config.AUTO_DETECT = flag1, flag2
    -- resume normal operation
  else
    local c = CONFIGURATION[profile]
    if not c then return false end
    for i, v in pairs(c) do config[i] = v end
  end
  return true
end
SetProfile("x86 standard") -- default profile

-----------------------------------------------------------------------
-- chunk constants
-- * changed in 5.1: VERSION, FPF, SIZE_* are now fixed; LUA_TBOOLEAN
--   added for constant table; TEST_NUMBER removed; FORMAT added
-----------------------------------------------------------------------
config.SIGNATURE    = "\27Lua"
-- TEST_NUMBER no longer needed, using size_lua_Number + integral
config.LUA_TNIL     = 0
config.LUA_TBOOLEAN = 1
config.LUA_TNUMBER  = 3
config.LUA_TSTRING  = 4
config.VERSION      = 81 -- 0x51
config.FORMAT       = 0  -- LUAC_FORMAT (new in 5.1)
config.FPF          = 50 -- LFIELDS_PER_FLUSH
config.SIZE_OP      = 6  -- instruction field bits
config.SIZE_A       = 8
config.SIZE_B       = 9
config.SIZE_C       = 9
-- MAX_STACK no longer needed for instruction decoding, removed
-- LUA_FIRSTINDEX currently not supported; used in SETLIST
config.LUA_FIRSTINDEX = 1

-----------------------------------------------------------------------
-- display options: you can set your defaults here
-----------------------------------------------------------------------
config.DISPLAY_FLAG = true              -- global listing output on/off
config.DISPLAY_BRIEF = nil              -- brief listing style
config.DISPLAY_INDENT = nil             -- indent flag for brief style
config.STATS = nil                      -- set if always display stats
config.DISPLAY_OFFSET_HEX = true        -- use hexadecimal for position
config.DISPLAY_SEP = "  "               -- column separator
config.DISPLAY_COMMENT = "; "           -- comment sign
config.DISPLAY_HEX_DATA = true          -- show hex data column
config.WIDTH_HEX = 8                    -- width of hex data column
config.WIDTH_OFFSET = nil               -- width of position column
config.DISPLAY_LOWERCASE = true         -- lower-case operands
config.WIDTH_OPCODE = nil               -- width of opcode field
config.VERBOSE_TEST = false             -- more verbosity for --test

--[[-------------------------------------------------------------------
-- Other globals
--]]-------------------------------------------------------------------

other_files = {}        -- non-chunks (may be source listings)
arg_other = {}          -- other arguments (for --run option)

--[[-------------------------------------------------------------------
-- Number handling functions
-- * converts a string of bytes to and from a proper number
-- * WARNING single() and double() can only do normal floats
--   and zeros. Denormals, infinities and NaNs are not recognized.
-- * See 5.0.2/ChunkSpy.lua for IEEE floating-point notes
--]]-------------------------------------------------------------------
convert_from = {}       -- tables for number conversion function lookup
convert_to = {}

-----------------------------------------------------------------------
-- support function for convert_to functions
-----------------------------------------------------------------------
function grab_byte(v)
  return math.floor(v / 256), string.char(math.floor(v) % 256)
end

-----------------------------------------------------------------------
-- No more TEST_NUMBER in Lua 5.1, uses size_lua_Number + integral
-----------------------------------------------------------------------
LUANUMBER_ID = {
  ["80"] = "double",         -- IEEE754 double
  ["40"] = "single",         -- IEEE754 single
  ["41"] = "int",            -- int
  ["81"] = "long long",      -- long long
}

-----------------------------------------------------------------------
-- Converts an 8-byte little-endian string to a IEEE754 double number
-- * NOTE: see warning about accuracy in the header comments!
-----------------------------------------------------------------------
convert_from["double"] = function(x)
  local sign = 1
  local mantissa = string.byte(x, 7) % 16
  for i = 6, 1, -1 do mantissa = mantissa * 256 + string.byte(x, i) end
  if string.byte(x, 8) > 127 then sign = -1 end
  local exponent = (string.byte(x, 8) % 128) * 16 +
                   math.floor(string.byte(x, 7) / 16)
  if exponent == 0 then return 0 end
  mantissa = (math.ldexp(mantissa, -52) + 1) * sign
  return math.ldexp(mantissa, exponent - 1023)
end

-----------------------------------------------------------------------
-- Converts a 4-byte little-endian string to a IEEE754 single number
-- * TODO UNTESTED!!! *
-----------------------------------------------------------------------
convert_from["single"] = function(x)
  local sign = 1
  local mantissa = string.byte(x, 3) % 128
  for i = 2, 1, -1 do mantissa = mantissa * 256 + string.byte(x, i) end
  if string.byte(x, 4) > 127 then sign = -1 end
  local exponent = (string.byte(x, 4) % 128) * 2 +
                   math.floor(string.byte(x, 3) / 128)
  if exponent == 0 then return 0 end
  mantissa = (math.ldexp(mantissa, -23) + 1) * sign
  return math.ldexp(mantissa, exponent - 127)
end

-----------------------------------------------------------------------
-- Converts a little-endian integer string to a number
-- * TODO UNTESTED!!! *
-----------------------------------------------------------------------
convert_from["int"] = function(x)
  local sum = 0
  for i = config.size_lua_Number, 1, -1 do
    sum = sum * 256 + string.byte(x, i)
  end
  -- test for negative number
  if string.byte(x, config.size_lua_Number) > 127 then
    sum = sum - math.ldexp(1, 8 * config.size_lua_Number)
  end
  return sum
end

-----------------------------------------------------------------------
-- * WARNING this will fail for large long longs (64-bit numbers)
--   because long longs exceeds the precision of doubles.
-----------------------------------------------------------------------
convert_from["long long"] = convert_from["int"]

-----------------------------------------------------------------------
-- Converts a IEEE754 double number to an 8-byte little-endian string
-- * NOTE: see warning about accuracy in the header comments!
-----------------------------------------------------------------------
convert_to["double"] = function(x)
  local sign = 0
  if x < 0 then sign = 1; x = -x end
  local mantissa, exponent = math.frexp(x)
  if x == 0 then -- zero
    mantissa, exponent = 0, 0
  else
    mantissa = (mantissa * 2 - 1) * math.ldexp(0.5, 53)
    exponent = exponent + 1022
  end
  local v, byte = "" -- convert to bytes
  x = mantissa
  for i = 1,6 do
    x, byte = grab_byte(x); v = v..byte -- 47:0
  end
  x, byte = grab_byte(exponent * 16 + x); v = v..byte -- 55:48
  x, byte = grab_byte(sign * 128 + x); v = v..byte -- 63:56
  return v
end

-----------------------------------------------------------------------
-- Converts a IEEE754 single number to a 4-byte little-endian string
-- * TODO UNTESTED!!! *
-----------------------------------------------------------------------
convert_to["single"] = function(x)
  local sign = 0
  if x < 0 then sign = 1; x = -x end
  local mantissa, exponent = math.frexp(x)
  if x == 0 then -- zero
    mantissa = 0; exponent = 0
  else
    mantissa = (mantissa * 2 - 1) * math.ldexp(0.5, 24)
    exponent = exponent + 126
  end
  local v, byte = "" -- convert to bytes
  x, byte = grab_byte(mantissa); v = v..byte -- 7:0
  x, byte = grab_byte(x); v = v..byte -- 15:8
  x, byte = grab_byte(exponent * 128 + x); v = v..byte -- 23:16
  x, byte = grab_byte(sign * 128 + x); v = v..byte -- 31:24
  return v
end

-----------------------------------------------------------------------
-- Converts a number to a little-endian integer string
-- * TODO UNTESTED!!! *
-----------------------------------------------------------------------

convert_to["int"] = function(x)
  local v = ""
  x = math.floor(x)
  if x >= 0 then
    for i = 1, config.size_lua_Number do
      v = v..string.char(x % 256); x = math.floor(x / 256)
    end
  else-- x < 0
    x = -x
    local carry = 1
    for i = 1, config.size_lua_Number do
      local c = 255 - (x % 256) + carry
      if c == 256 then c = 0; carry = 1 else carry = 0 end
      v = v..string.char(c); x = math.floor(x / 256)
    end
  end
  -- optional overflow test; not enabled at the moment
  -- if x > 0 then error("number conversion overflow") end
  return v
end

-----------------------------------------------------------------------
-- * WARNING this will fail for large long longs (64-bit numbers)
--   because long longs exceeds the precision of doubles.
-----------------------------------------------------------------------
convert_to["long long"] = convert_to["int"]

--[[-------------------------------------------------------------------
-- Display support functions
-- * considerable work is done to maintain nice alignments
-- * some widths are initialized at chunk start
-- * this is meant to make output customization easy
--]]-------------------------------------------------------------------

-----------------------------------------------------------------------
-- width of number, left justify, zero padding
-----------------------------------------------------------------------
function WidthOf(n) return string.len(tostring(n)) end
function LeftJustify(s, width) return s..string.rep(" ", width - string.len(s)) end
function ZeroPad(s, width) return string.rep("0", width - string.len(s))..s end

-----------------------------------------------------------------------
-- initialize display formatting settings
-- * chunk_size parameter used to set width of position column
-----------------------------------------------------------------------
function DisplayInit(chunk_size)
  ---------------------------------------------------------------
  -- set up printing widths
  ---------------------------------------------------------------
  if not config.WIDTH_OFFSET then config.WIDTH_OFFSET = 0 end
  if config.DISPLAY_OFFSET_HEX then
    local w = string.len(string.format("%X", chunk_size))
    if w > config.WIDTH_OFFSET then config.WIDTH_OFFSET = w end
    if (config.WIDTH_OFFSET % 2) == 1 then
      config.WIDTH_OFFSET = config.WIDTH_OFFSET + 1
    end
  else
    config.WIDTH_OFFSET = string.len(tonumber(chunk_size))
  end
  ---------------------------------------------------------------
  -- sane defaults
  ---------------------------------------------------------------
  if config.WIDTH_OFFSET < 4 then config.WIDTH_OFFSET = 4 end
  if not config.DISPLAY_SEP then config.DISPLAY_SEP = "  " end
  if config.DISPLAY_HEX_DATA == nil then config.DISPLAY_HEX_DATA = true end
  if not config.WIDTH_HEX then config.WIDTH_HEX = 8 end
  config.BLANKS_HEX_DATA = string.rep(" ", config.WIDTH_HEX * 2 + 1)

  -- default output path
  if not WriteLine then WriteLine = print end
end

-----------------------------------------------------------------------
-- initialize listing output path (an optional redirect)
-- * this is done before calling ChunkSpy() to redirect output
-----------------------------------------------------------------------
function OutputInit()
  if config.OUTPUT_FILE then
    if type(config.OUTPUT_FILE) == "string" then
      local INF = io.open(config.OUTPUT_FILE, "wb")
      if not INF then
        error("cannot open \""..config.OUTPUT_FILE.."\" for writing")
      end
      config.OUTPUT_FILE = INF
      WriteLine = function(s) config.OUTPUT_FILE:write(s, "\n") end
    end
  end
end

-----------------------------------------------------------------------
-- cleanup listing output path
-----------------------------------------------------------------------
function OutputExit()
  if WriteLine and WriteLine ~= print then io.close(config.OUTPUT_FILE) end
end

-----------------------------------------------------------------------
-- escape control bytes in strings
-----------------------------------------------------------------------
function EscapeString(s, quoted)
  local v = ""
  for i = 1, string.len(s) do
    local c = string.byte(s, i)
    -- other escapees with values > 31 are "(34), \(92)
    if c < 32 or c == 34 or c == 92 then
      if c >= 7 and c <= 13 then
        c = string.sub("abtnvfr", c - 6, c - 6)
      elseif c == 34 or c == 92 then
        c = string.char(c)
      end
      v = v.."\\"..c
    else-- 32 <= v <= 255
      v = v..string.char(c)
    end
  end
  if quoted then return string.format("\"%s\"", v) end
  return v
end

-----------------------------------------------------------------------
-- listing legend/header
-----------------------------------------------------------------------
function HeaderLine()
  if not config.DISPLAY_FLAG or config.DISPLAY_BRIEF then return end
  WriteLine(LeftJustify("Pos", config.WIDTH_OFFSET)..config.DISPLAY_SEP
            ..LeftJustify("Hex Data", config.WIDTH_HEX * 2 + 1)..config.DISPLAY_SEP
            .."Description or Code\n"
            ..string.rep("-", 72))
end

-----------------------------------------------------------------------
-- description-only line, no position or hex data
-----------------------------------------------------------------------
function DescLine(desc)
  if not config.DISPLAY_FLAG or config.DISPLAY_BRIEF then return end
  WriteLine(string.rep(" ", config.WIDTH_OFFSET)..config.DISPLAY_SEP
            ..config.BLANKS_HEX_DATA..config.DISPLAY_SEP
            ..desc)
end

-----------------------------------------------------------------------
-- optionally display a pre-formatted statistic
-----------------------------------------------------------------------
function DisplayStat(stat)
  if config.STATS and not config.DISPLAY_BRIEF then DescLine(stat) end
end

-----------------------------------------------------------------------
-- returns position, i uses string index (starts from 1)
-----------------------------------------------------------------------
function FormatPos(i)
  local pos
  if config.DISPLAY_OFFSET_HEX then
    pos = string.format("%X", i - 1)
  else
    pos = tonumber(i - 1)
  end
  return ZeroPad(pos, config.WIDTH_OFFSET)
end

--[[-------------------------------------------------------------------
-- Instruction decoder functions (changed in Lua 5.1)
-- * some fixed decode data is placed in the config table
-- * these function are quite flexible, they can accept non-standard
--   instruction field sizes as long as the arrangement is the same.
-----------------------------------------------------------------------
  Visually, an instruction can be represented as one of:

   31      |     |     |         0  bit position
    +-----+-----+-----+----------+
    |  B  |  C  |  A  |  Opcode  |  iABC format
    +-----+-----+-----+----------+
    -  9  -  9  -  8  -    6     -  field sizes (standard Lua)
    +-----+-----+-----+----------+
    |   [s]Bx   |  A  |  Opcode  |  iABx | iAsBx format
    +-----+-----+-----+----------+

  The signed argument sBx is represented in excess K, with the range
  of -max to +max represented by 0 to 2*max.

  For RK(x) constants, MSB is set and constant number is in the rest
  of the bits.

--]]-------------------------------------------------------------------

-----------------------------------------------------------------------
-- instruction decoder initialization
-----------------------------------------------------------------------
function DecodeInit()
  ---------------------------------------------------------------
  -- calculate masks
  ---------------------------------------------------------------
  config.SIZE_Bx = config.SIZE_B + config.SIZE_C
  local MASK_OP = math.ldexp(1, config.SIZE_OP)
  local MASK_A  = math.ldexp(1, config.SIZE_A)
  local MASK_B  = math.ldexp(1, config.SIZE_B)
  local MASK_C  = math.ldexp(1, config.SIZE_C)
  local MASK_Bx = math.ldexp(1, config.SIZE_Bx)
  config.MAXARG_sBx = math.floor((MASK_Bx - 1) / 2)
  config.BITRK = math.ldexp(1, config.SIZE_B - 1)

  ---------------------------------------------------------------
  -- iABC instruction segment tables
  ---------------------------------------------------------------
  config.iABC = {       -- tables allows field sequence to be extracted
    config.SIZE_OP,     -- using a loop; least significant field first
    config.SIZE_A,      -- additional lookups below, kludgy
    config.SIZE_C,
    config.SIZE_B,
  }
  config.mABC = { MASK_OP, MASK_A, MASK_C, MASK_B, }
  config.nABC = { "OP", "A", "C", "B", }

  ---------------------------------------------------------------
  -- opcode name table
  ---------------------------------------------------------------
  local op =
    "MOVE LOADK LOADBOOL LOADNIL GETUPVAL \
    GETGLOBAL GETTABLE SETGLOBAL SETUPVAL SETTABLE \
    NEWTABLE SELF ADD SUB MUL \
    DIV MOD POW UNM NOT \
    LEN CONCAT JMP EQ LT \
    LE TEST TESTSET CALL TAILCALL RETURN \
    FORLOOP FORPREP TFORLOOP SETLIST \
    CLOSE CLOSURE VARARG"

  ---------------------------------------------------------------
  -- build opcode name table
  ---------------------------------------------------------------
  config.opnames = {}
  config.NUM_OPCODES = 0
  if not config.WIDTH_OPCODE then config.WIDTH_OPCODE = 0 end
  for v in string.gmatch(op, "[^%s]+") do
    if config.DISPLAY_LOWERCASE then v = string.lower(v) end
    config.opnames[config.NUM_OPCODES] = v
    local vlen = string.len(v)
    -- find maximum opcode length
    if vlen > config.WIDTH_OPCODE then
      config.WIDTH_OPCODE = vlen
    end
    config.NUM_OPCODES = config.NUM_OPCODES + 1
  end
  -- opmode: 0=ABC, 1=ABx, 2=AsBx
  config.opmode = "01000101000000000000002000000002200010"

  ---------------------------------------------------------------
  -- initialize text widths and formats for display
  ---------------------------------------------------------------
  config.WIDTH_A = WidthOf(MASK_A)
  config.WIDTH_B = WidthOf(MASK_B)
  config.WIDTH_C = WidthOf(MASK_C)
  config.WIDTH_Bx = WidthOf(MASK_Bx) + 1 -- with minus sign
  config.FORMAT_A = string.format("%%-%dd", config.WIDTH_A)
  config.FORMAT_B = string.format("%%-%dd", config.WIDTH_B)
  config.FORMAT_C = string.format("%%-%dd", config.WIDTH_C)
  config.PAD_Bx = config.WIDTH_A + config.WIDTH_B + config.WIDTH_C + 2
                  - config.WIDTH_Bx
  if config.PAD_Bx > 0 then
    config.PAD_Bx = string.rep(" ", config.PAD_Bx)
  else
    config.PAD_Bx = ""
  end
  config.FORMAT_Bx  = string.format("%%-%dd", config.WIDTH_Bx)
  config.FORMAT_AB  = string.format("%s %s %s", config.FORMAT_A, config.FORMAT_B, string.rep(" ", config.WIDTH_C))
  config.FORMAT_ABC = string.format("%s %s %s", config.FORMAT_A, config.FORMAT_B, config.FORMAT_C)
  config.FORMAT_AC  = string.format("%s %s %s", config.FORMAT_A, string.rep(" ", config.WIDTH_B), config.FORMAT_C)
  config.FORMAT_ABx = string.format("%s %s", config.FORMAT_A, config.FORMAT_Bx)
end

-----------------------------------------------------------------------
-- instruction decoder
-- * decoder loops starting from the least-significant byte, this allow
--   a field to be extracted using % operations
-- * returns a table populated with the appropriate fields
-- * WARNING B,C arrangement is hard-coded here for calculating [s]Bx
-----------------------------------------------------------------------
function DecodeInst(code, iValues)
  local iSeq, iMask = config.iABC, config.mABC
  local cValue, cBits, cPos = 0, 0, 1
  -- decode an instruction
  for i = 1, #iSeq do
    -- if need more bits, suck in a byte at a time
    while cBits < iSeq[i] do
      cValue = string.byte(code, cPos) * math.ldexp(1, cBits) + cValue
      cPos = cPos + 1; cBits = cBits + 8
    end
    -- extract and set an instruction field
    iValues[config.nABC[i]] = cValue % iMask[i]
    cValue = math.floor(cValue / iMask[i])
    cBits = cBits - iSeq[i]
  end
  iValues.opname = config.opnames[iValues.OP]   -- get mnemonic
  iValues.opmode = string.sub(config.opmode, iValues.OP + 1, iValues.OP + 1)
  if iValues.opmode == "1" then                 -- set Bx or sBx
    iValues.Bx = iValues.B * iMask[3] + iValues.C
  elseif iValues.opmode == "2" then
    iValues.sBx = iValues.B * iMask[3] + iValues.C - config.MAXARG_sBx
  end
  return iValues
end

-----------------------------------------------------------------------
-- encodes an instruction into a little-endian byte string
-- * encodes from OP/A/B/C fields, to enable bit field size changes
-----------------------------------------------------------------------
function EncodeInst(inst)
  local v, i = "", 0
  local cValue, cBits, cPos = 0, 0, 1
  -- encode an instruction
  while i < config.size_Instruction do
    -- if need more bits, suck in a field at a time
    while cBits < 8 do
      cValue = inst[config.nABC[cPos]] * math.ldexp(1, cBits) + cValue
      cBits = cBits + config.iABC[cPos]; cPos = cPos + 1
    end
    -- extract bytes to instruction string
    while cBits >= 8 do
      v = v..string.char(cValue % 256)
      cValue = math.floor(cValue / 256)
      cBits = cBits - 8; i = i + 1
    end
  end
  return v
end

-----------------------------------------------------------------------
-- describe an instruction
-- * make instructions descriptions more verbose and readable
-----------------------------------------------------------------------
function DescribeInst(inst, pos, func)
  local Operand
  local Comment = ""

  ---------------------------------------------------------------
  -- operand formatting helpers
  ---------------------------------------------------------------
  local function OperandAB(i)   return string.format(config.FORMAT_AB, i.A, i.B) end
  local function OperandABC(i)  return string.format(config.FORMAT_ABC, i.A, i.B, i.C) end
  local function OperandAC(i)   return string.format(config.FORMAT_AC, i.A, i.C) end
  local function OperandABx(i)  return string.format(config.FORMAT_ABx, i.A, i.Bx) end
  local function OperandAsBx(i) return string.format(config.FORMAT_ABx, i.A, i.sBx) end

  ---------------------------------------------------------------
  -- comment formatting helpers
  -- calculate jump location, conditional flag
  ---------------------------------------------------------------
  local function CommentLoc(sBx, cond)
    local loc = string.format("to [%d]", pos + 1 + sBx)
    if cond then loc = loc..cond end
    return loc
  end

  ---------------------------------------------------------------
  -- Kst(x) - constant (in constant table)
  ---------------------------------------------------------------
  local function CommentK(index, quoted)
    local c = func.k[index + 1]
    if type(c) == "string" then
      return EscapeString(c, quoted)
    elseif type(c) == "number" or type(c) == "boolean" then
      return tostring(c)
    else
      return "nil"
    end
  end

  ---------------------------------------------------------------
  -- RK(x) == if BITRK then Kst(x&~BITRK) else R(x)
  ---------------------------------------------------------------
  local function CommentRK(index, quoted)
    if index >= config.BITRK then
      return CommentK(index - config.BITRK, quoted)
    else
      return ""
    end
  end

  ---------------------------------------------------------------
  -- comments for RK(B), RK(C)
  ---------------------------------------------------------------
  local function CommentBC(inst)
    local B, C = CommentRK(inst.B, true), CommentRK(inst.C, true)
    if B == "" then
      if C == "" then return "" else return C end
    elseif C == "" then
      return B
    else
      return B.." "..C
    end
  end

  ---------------------------------------------------------------
  -- floating point byte conversion
  -- bit positions: mmmmmxxx, actual: (1xxx) * 2^(m-1)
  ---------------------------------------------------------------
  local function fb2int(x)
    local e = math.floor(x / 8) % 32
    if e == 0 then return x end
    return math.ldexp((x % 8) + 8, e - 1)
  end

  ---------------------------------------------------------------
  -- yeah, I know this is monstrous...
  -- * see the descriptions in lopcodes.h for more information
  ---------------------------------------------------------------
  if inst.prev then -- continuation of SETLIST
    Operand = string.format(config.FORMAT_Bx, func.code[pos])..config.PAD_Bx
  ---------------------------------------------------------------
  elseif inst.OP ==  0 then -- MOVE A B
    Operand = OperandAB(inst)
  ---------------------------------------------------------------
  elseif inst.OP ==  1 then -- LOADK A Bx
    Operand = OperandABx(inst)
    Comment = CommentK(inst.Bx, true)
  ---------------------------------------------------------------
  elseif inst.OP ==  2 then -- LOADBOOL A B C
    Operand = OperandABC(inst)
    if inst.B == 0 then Comment = "false" else Comment = "true" end
    if inst.C > 0 then Comment = Comment..", "..CommentLoc(1) end
  ---------------------------------------------------------------
  elseif inst.OP ==  3 then -- LOADNIL A B
    Operand = OperandAB(inst)
  ---------------------------------------------------------------
  elseif inst.OP ==  4 then -- GETUPVAL A B
    Operand = OperandAB(inst)
    Comment = func.upvalues[inst.B + 1]
  ---------------------------------------------------------------
  elseif inst.OP ==  5 or   -- GETGLOBAL A Bx
         inst.OP ==  7 then -- SETGLOBAL A Bx
    Operand = OperandABx(inst)
    Comment = CommentK(inst.Bx)
  ---------------------------------------------------------------
  elseif inst.OP ==  6 then -- GETTABLE A B C
    Operand = OperandABC(inst)
    Comment = CommentRK(inst.C, true)
  ---------------------------------------------------------------
  elseif inst.OP ==  8 then -- SETUPVAL A B
    Operand = OperandAB(inst)
    Comment = func.upvalues[inst.B + 1]
  ---------------------------------------------------------------
  elseif inst.OP ==  9 then -- SETTABLE A B C
    Operand = OperandABC(inst)
    Comment = CommentBC(inst)
  ---------------------------------------------------------------
  elseif inst.OP == 10 then -- NEWTABLE A B C
    Operand = OperandABC(inst)
    local ar = fb2int(inst.B)  -- array size
    local hs = fb2int(inst.C)  -- hash size
    Comment = "array="..ar..", hash="..hs
  ---------------------------------------------------------------
  elseif inst.OP == 11 then -- SELF A B C
    Operand = OperandABC(inst)
    Comment = CommentRK(inst.C, true)
  ---------------------------------------------------------------
  elseif inst.OP == 12 or   -- ADD A B C
         inst.OP == 13 or   -- SUB A B C
         inst.OP == 14 or   -- MUL A B C
         inst.OP == 15 or   -- DIV A B C
         inst.OP == 16 or   -- MOD A B C
         inst.OP == 17 then -- POW A B C
    Operand = OperandABC(inst)
    Comment = CommentBC(inst)
  ---------------------------------------------------------------
  elseif inst.OP == 18 or   -- UNM A B
         inst.OP == 19 or   -- NOT A B
         inst.OP == 20 then -- LEN A B
    Operand = OperandAB(inst)
  ---------------------------------------------------------------
  elseif inst.OP == 21 then -- CONCAT A B C
    Operand = OperandABC(inst)
  ---------------------------------------------------------------
  elseif inst.OP == 22 then -- JMP sBx
    Operand = string.format(config.FORMAT_Bx, inst.sBx)..config.PAD_Bx
    Comment = CommentLoc(inst.sBx)
  ---------------------------------------------------------------
  elseif inst.OP == 23 or   -- EQ A B C
         inst.OP == 24 or   -- LT A B C
         inst.OP == 25 or   -- LE A B C
         inst.OP == 27 then -- TESTSET A B C
    Operand = OperandABC(inst)
    if inst.OP ~= 27 then Comment = CommentBC(inst) end
    if Comment ~= "" then Comment = Comment..", " end
    -- since the pc++ is in the 'else' path, the sense is opposite
    local sense = " if false"
    if inst.OP == 27 then
      if inst.C == 0 then sense = " if true" end
    else
      if inst.A == 0 then sense = " if true" end
    end
    Comment = Comment..CommentLoc(1, sense)
  elseif inst.OP == 26 then -- TEST A C
    Operand = OperandAC(inst)
    local sense = " if false"
    if inst.C == 0 then sense = " if true" end
    Comment = Comment..CommentLoc(1, sense)
  ---------------------------------------------------------------
  elseif inst.OP == 28 or   -- CALL A B C
         inst.OP == 29 then -- TAILCALL A B C
    Operand = OperandABC(inst)
  ---------------------------------------------------------------
  elseif inst.OP == 30 then -- RETURN A B
    Operand = OperandAB(inst)
  ---------------------------------------------------------------
  elseif inst.OP == 31 then -- FORLOOP A sBx
    Operand = OperandAsBx(inst)
    Comment = CommentLoc(inst.sBx, " if loop")
  ---------------------------------------------------------------
  elseif inst.OP == 32 then -- FORPREP A sBx
    Operand = OperandAsBx(inst)
    Comment = CommentLoc(inst.sBx)
  ---------------------------------------------------------------
  elseif inst.OP == 33 then -- TFORLOOP A C
    Operand = OperandAC(inst)
    Comment = CommentLoc(1, " if exit")
  ---------------------------------------------------------------
  elseif inst.OP == 34 then -- SETLIST A B C
    Operand = OperandABC(inst)
    -- R(A)[(C-1)*FPF+i] := R(A+i), 1 <= i <= B
    local n = inst.B
    local c = inst.C
    if c == 0 then
      -- grab next inst when index position is large
      c = func.code[pos + 1]
      func.inst[pos + 1].prev = true
    end
    local start = (c - 1) * config.FPF + 1
    local last = start + n - 1
    Comment = "index "..start.." to "
    if n ~= 0 then
      Comment = Comment..last
    else
      Comment = Comment.."top"
    end
  ---------------------------------------------------------------
  elseif inst.OP == 35 then -- CLOSE A
    Operand = string.format(config.FORMAT_A, inst.A)
  ---------------------------------------------------------------
  elseif inst.OP == 36 then -- CLOSURE A Bx
    Operand = OperandABx(inst)
    -- lets user know how many following instructions are significant
    Comment = func.p[inst.Bx + 1].nups.." upvalues"
  ---------------------------------------------------------------
  elseif inst.OP == 37 then -- VARARG A B
    Operand = OperandAB(inst)
  ---------------------------------------------------------------
  else
    -- add your VM extensions here
    Operand = string.format("OP %d", inst.OP)
  end

  ---------------------------------------------------------------
  -- compose operands and comments
  ---------------------------------------------------------------
  if Comment and Comment ~= "" then
    Operand = Operand..config.DISPLAY_SEP
              ..config.DISPLAY_COMMENT..Comment
  end
  return LeftJustify(inst.opname, config.WIDTH_OPCODE)
         ..config.DISPLAY_SEP..Operand
end

--[[-------------------------------------------------------------------
-- Source listing merging
-- * for convenience, file name matching is first via case-sensitive
--   comparison, then case-insensitive comparison, and the first
--   match found using either method is the one that is used
--]]-------------------------------------------------------------------

-----------------------------------------------------------------------
-- initialize source list for merging
-- * this will normally be called by the main chunk function
-- * the source listing is read only once, upon initialization
-----------------------------------------------------------------------
function SourceInit(source)
  if config.source then config.srcprev = 0; return end
  if not source or source == "" or
     string.sub(source, 1, 1) ~= "@" then
    return
  end
  source = string.sub(source, 2)                -- chomp leading @
  for _, fname in ipairs(other_files) do        -- find a match
    if not config.source then
      if fname == source or
         string.lower(fname) == string.lower(source) then
        config.source = fname
      end
    end
  end
  if not config.source then return end          -- no source file
  local INF = io.open(config.source, "rb")      -- read in source file
  if not INF then
    error("cannot read file \""..filename.."\"")
  end
  config.srcline = {}; config.srcmark = {}
  local n, line = 1
  repeat
    line = INF:read("*l")
    if line then
      config.srcline[n], config.srcmark[n] = line, false
      n = n + 1
    end
  until not line
  io.close(INF)
  config.srcsize = n - 1
  config.DISPLAY_SRC_WIDTH = WidthOf(config.srcsize)
  config.srcprev = 0
end

-----------------------------------------------------------------------
-- mark source lines
-- * marks source lines as a function is read to delineate stuff
-----------------------------------------------------------------------
function SourceMark(func)
  if not config.source then return end
  if func.sizelineinfo == 0 then return end
  for i = 1, func.sizelineinfo do
    if i <= config.srcsize then
      config.srcmark[func.lineinfo[i]] = true
    end
  end
end

-----------------------------------------------------------------------
-- generate source lines
-- * peek at lines above and print them if they have not been printed
-- * mark all printed lines so all non-code lines are printed once only
-----------------------------------------------------------------------
function SourceMerge(func, pc)
  if not config.source or not config.DISPLAY_FLAG then return end
  local lnum = func.lineinfo[pc]
  -- don't print anything new if instruction is on the same line
  if config.srcprev == lnum then return end
  config.srcprev = lnum
  if config.srcsize < lnum then return end      -- something fishy
  local lfrom = lnum
  config.srcmark[lnum] = true
  while lfrom > 1 and config.srcmark[lfrom - 1] == false do
    lfrom = lfrom - 1
    config.srcmark[lfrom] = true
  end
  for i = lfrom, lnum do
    WriteLine(config.DISPLAY_COMMENT
              .."("..ZeroPad(i, config.DISPLAY_SRC_WIDTH)..")"
              ..config.DISPLAY_SEP..config.srcline[i])
  end
end

--[[-------------------------------------------------------------------
-- ChunkSpy main processing function
-- * in order to maintain correct positional order, the listing will
--   show functions as nested; a level number is kept to help the
--   user trace the extent of functions in the listing
--]]-------------------------------------------------------------------

function ChunkSpy(chunk_name, chunk)
  ---------------------------------------------------------------
  -- variables
  ---------------------------------------------------------------
  local idx = 1
  local previdx, len
  local result = {}     -- table with all parsed data
  local stat = {}
  result.chunk_name = chunk_name or ""
  result.chunk_size = string.len(chunk)

  ---------------------------------------------------------------
  -- tests if a given number of bytes is available
  ---------------------------------------------------------------
  local function TestChunk(size, idx, errmsg)
    if idx + size - 1 > result.chunk_size then
      error(string.format("chunk too small for %s at offset %d", errmsg, idx - 1))
    end
  end

  ---------------------------------------------------------------
  -- loads a single byte and returns it as a number
  ---------------------------------------------------------------
  local function LoadByte()
    previdx = idx
    idx = idx + 1
    return string.byte(chunk, previdx)
  end

  -------------------------------------------------------------
  -- loads a block of endian-sensitive bytes
  -- * rest of code assumes little-endian by default
  -------------------------------------------------------------
  local function LoadBlock(size)
    if not pcall(TestChunk, size, idx, "LoadBlock") then return end
    previdx = idx
    idx = idx + size
    local b = string.sub(chunk, idx - size, idx - 1)
    if config.endianness == 1 then
      return b
    else-- reverse bytes if big endian
      return string.reverse(b)
    end
  end

  ---------------------------------------------------------------
  -- display a position, hex data, description line
  ---------------------------------------------------------------
  function FormatLine(size, desc, index, segment)
    if not config.DISPLAY_FLAG or config.DISPLAY_BRIEF then return end
    if config.DISPLAY_HEX_DATA then
      -- nicely formats binary chunk data in multiline hexadecimal
      if size == 0 then
        WriteLine(FormatPos(index)..config.DISPLAY_SEP
                  ..config.BLANKS_HEX_DATA..config.DISPLAY_SEP
                  ..desc)
      else
        -- split hex data into config.WIDTH_HEX byte strings
        while size > 0 do
          local d, dlen = "", size
          if size > config.WIDTH_HEX then dlen = config.WIDTH_HEX end
          -- build hex data digits
          for i = 0, dlen - 1 do
            d = d..string.format("%02X", string.byte(chunk, index + i))
          end
          -- add padding or continuation indicator
          d = d..string.rep("  ", config.WIDTH_HEX - dlen)
          if segment or size > config.WIDTH_HEX then
            d = d.."+"; size = size - config.WIDTH_HEX
          else
            d = d.." "; size = 0
          end
          -- description only on first line of a multiline
          if desc then
            WriteLine(FormatPos(index)..config.DISPLAY_SEP
                      ..d..config.DISPLAY_SEP
                      ..desc)
            desc = nil
          else
            WriteLine(FormatPos(index)..config.DISPLAY_SEP..d)
          end
          index = index + dlen
        end--while
      end--if size
    else--no hex data mode
      WriteLine(FormatPos(index)..config.DISPLAY_SEP..desc)
    end
    -- end of FormatLine
  end

  ---------------------------------------------------------------
  -- initialize listing display
  ---------------------------------------------------------------
  DisplayInit(result.chunk_size)
  HeaderLine()                  -- listing display starts here
  if result.chunk_name then
    FormatLine(0, "** source chunk: "..result.chunk_name, idx)
    if config.DISPLAY_BRIEF then WriteLine(config.DISPLAY_COMMENT.."source chunk: "..result.chunk_name) end
  end
  DescLine("** global header start **")

  ---------------------------------------------------------------
  -- test signature
  ---------------------------------------------------------------
  len = string.len(config.SIGNATURE)
  TestChunk(len, idx, "header signature")
  if string.sub(chunk, 1, len) ~= config.SIGNATURE then
    error("header signature not found, this is not a Lua chunk")
  end
  FormatLine(len, "header signature: "..EscapeString(config.SIGNATURE, 1), idx)
  idx = idx + len

  ---------------------------------------------------------------
  -- test version
  ---------------------------------------------------------------
  TestChunk(1, idx, "version byte")
  result.version = LoadByte()
  if result.version ~= config.VERSION then
    error(string.format("ChunkSpy cannot read version %02X chunks", result.version))
  end
  FormatLine(1, "version (major:minor hex digits)", previdx)

  ---------------------------------------------------------------
  -- test format (5.1)
  -- * ChunkSpy does not accept anything other than 0. For custom
  -- * binary chunks, modify ChunkSpy to read it properly.
  ---------------------------------------------------------------
  TestChunk(1, idx, "format byte")
  result.format = LoadByte()
  if result.format ~= config.FORMAT then
    error(string.format("ChunkSpy cannot read format %02X chunks", result.format))
  end
  FormatLine(1, "format (0=official)", previdx)

  ---------------------------------------------------------------
  -- test endianness
  ---------------------------------------------------------------
  TestChunk(1, idx, "endianness byte")
  local endianness = LoadByte()
  if not config.AUTO_DETECT then
    if endianness ~= config.endianness then
      error("unsupported endianness")
    end
  else
    config.endianness = endianness
  end
  FormatLine(1, "endianness (1=little endian)", previdx)

  ---------------------------------------------------------------
  -- test sizes
  ---------------------------------------------------------------
  TestChunk(4, idx, "size bytes")
  local function TestSize(mysize, sizename, typename)
    local byte = LoadByte()
    if not config.AUTO_DETECT then
      if byte ~= config[mysize] then
        error(string.format("mismatch in %s size (needs %d but read %d)",
          sizename, config[mysize], byte))
      end
    else
      config[mysize] = byte
    end
    FormatLine(1, string.format("size of %s (%s)", sizename, typename), previdx)
  end
  -- byte sizes
  TestSize("size_int", "int", "bytes")
  TestSize("size_size_t", "size_t", "bytes")
  TestSize("size_Instruction", "Instruction", "bytes")
  TestSize("size_lua_Number", "number", "bytes")
  -- initialize decoder (see the 5.0.2 script if you want to customize
  -- bit field sizes; Lua 5.1 has fixed instruction bit field sizes)
  DecodeInit()

  ---------------------------------------------------------------
  -- test integral flag (5.1)
  ---------------------------------------------------------------
  TestChunk(1, idx, "integral byte")
  config.integral = LoadByte()
  FormatLine(1, "integral (1=integral)", previdx)

  ---------------------------------------------------------------
  -- verify or determine lua_Number type
  ---------------------------------------------------------------
  local num_id = config.size_lua_Number .. config.integral
  if not config.AUTO_DETECT then
    if config.number_type ~= LUANUMBER_ID[num_id] then
      error("incorrect lua_Number format or bad test number")
    end
  else
    -- look for a number type match in our table
    config.number_type = nil
    for i, v in pairs(LUANUMBER_ID) do
      if num_id == i then config.number_type = v end
    end
    if not config.number_type then
      error("unrecognized lua_Number type")
    end
  end
  DescLine("* number type: "..config.number_type)

  ---------------------------------------------------------------
  -- primitive platform auto-detection
  ---------------------------------------------------------------
  if config.AUTO_DETECT then
    config.description = nil
    for _, cfg in pairs(CONFIGURATION) do
      if cfg.endianness == config.endianness and
         cfg.size_int == config.size_int and
         cfg.size_size_t == config.size_size_t and
         cfg.size_Instruction == config.size_Instruction and
         cfg.size_lua_Number == config.size_lua_Number and
         cfg.integral == config.integral and
         cfg.number_type == config.number_type then
        config.description = cfg.description
      end
    end
    if not config.description then
      config.description = "chunk platform unrecognized"
    end
    -- some parameters are not in the global header, e.g. FPF
    -- see the config table for more on these constants
  end
  DescLine("* "..config.description)
  if config.DISPLAY_BRIEF then WriteLine(config.DISPLAY_COMMENT..config.description) end
  -- end of global header
  stat.header = idx - 1
  DisplayStat("* global header = "..stat.header.." bytes")
  DescLine("** global header end **")

  ---------------------------------------------------------------
  -- this is recursively called to load the chunk or function body
  ---------------------------------------------------------------
  local function LoadFunction(funcname, num, level)
    local func = {}

    -------------------------------------------------------------
    -- loads an integer (signed)
    -------------------------------------------------------------
    local function LoadInt()
      local x = LoadBlock(config.size_int)
      if not x then
        error("could not load integer")
      else
        local sum = 0
        for i = config.size_int, 1, -1 do
          sum = sum * 256 + string.byte(x, i)
        end
        -- test for negative number
        if string.byte(x, config.size_int) > 127 then
          sum = sum - math.ldexp(1, 8 * config.size_int)
        end
        -- from the looks of it, integers needed are positive
        if sum < 0 then error("bad integer") end
        return sum
      end
    end

    -------------------------------------------------------------
    -- loads a size_t (assume unsigned)
    -------------------------------------------------------------
    local function LoadSize()
      local x = LoadBlock(config.size_size_t)
      if not x then
        --error("could not load size_t") handled in LoadString()
        return
      else
        local sum = 0
        for i = config.size_size_t, 1, -1 do
          sum = sum * 256 + string.byte(x, i)
        end
        return sum
      end
    end

    -------------------------------------------------------------
    -- loads a number (lua_Number type)
    -------------------------------------------------------------
    local function LoadNumber()
      local x = LoadBlock(config.size_lua_Number)
      if not x then
        error("could not load lua_Number")
      else
        local convert_func = convert_from[config.number_type]
        if not convert_func then
          error("could not find conversion function for lua_Number")
        end
        return convert_func(x)
      end
    end

    -------------------------------------------------------------
    -- load a string (size, data pairs)
    -------------------------------------------------------------
    local function LoadString()
      local len = LoadSize()
      if not len then
        error("could not load String")
      else
        if len == 0 then        -- there is no error, return a nil
          return nil
        end
        TestChunk(len, idx, "LoadString")
        -- note that ending NUL is removed
        local s = string.sub(chunk, idx, idx + len - 2)
        idx = idx + len
        return s
      end
    end

    -------------------------------------------------------------
    -- load line information
    -------------------------------------------------------------
    local function LoadLines()
      local size = LoadInt()
      func.pos_lineinfo = previdx
      func.lineinfo = {}
      func.sizelineinfo = size
      for i = 1, size do
        func.lineinfo[i] = LoadInt()
      end
    end

    -------------------------------------------------------------
    -- load locals information
    -------------------------------------------------------------
    local function LoadLocals()
      local n = LoadInt()
      func.pos_locvars = previdx
      func.locvars = {}
      func.sizelocvars = n
      for i = 1, n do
        local locvar = {}
        locvar.varname = LoadString()
        locvar.pos_varname = previdx
        locvar.startpc = LoadInt()
        locvar.pos_startpc = previdx
        locvar.endpc = LoadInt()
        locvar.pos_endpc = previdx
        func.locvars[i] = locvar
      end
    end

    -------------------------------------------------------------
    -- load upvalues information
    -------------------------------------------------------------
    local function LoadUpvalues()
      local n = LoadInt()
      if n ~= 0 and n~= func.nups then
        error(string.format("bad nupvalues: read %d, expected %d", n, func.nups))
        return
      end
      func.pos_upvalues = previdx
      func.upvalues = {}
      func.sizeupvalues = n
      func.posupvalues = {}
      for i = 1, n do
        func.upvalues[i] = LoadString()
        func.posupvalues[i] = previdx
        if not func.upvalues[i] then
          error("empty string at index "..(i - 1).."in upvalue table")
        end
      end
    end

    -------------------------------------------------------------
    -- load constants information (data)
    -------------------------------------------------------------
    local function LoadConstantKs()
      local n = LoadInt()
      func.pos_ks = previdx
      func.k = {}
      func.sizek = n
      func.posk = {}
      for i = 1, n do
        local t = LoadByte()
        func.posk[i] = previdx
        if t == config.LUA_TNUMBER then
          func.k[i] = LoadNumber()
        elseif t == config.LUA_TBOOLEAN then
          local b = LoadByte()
          if b == 0 then b = false else b = true end
          func.k[i] = b
        elseif t == config.LUA_TSTRING then
          func.k[i] = LoadString()
        elseif t == config.LUA_TNIL then
          func.k[i] = nil
        else
          error("bad constant type "..t.." at "..previdx)
        end
      end--for
    end

    -------------------------------------------------------------
    -- load constants information (local functions)
    -------------------------------------------------------------
    local function LoadConstantPs()
      local n = LoadInt()
      func.pos_ps = previdx
      func.p = {}
      func.sizep = n
      for i = 1, n do
        -- recursive call back on itself, next level
        func.p[i] = LoadFunction(func.source, i - 1, level + 1)
      end
    end

    -------------------------------------------------------------
    -- load function code
    -------------------------------------------------------------
    local function LoadCode()
      local size = LoadInt()
      func.pos_code = previdx
      func.code = {}
      func.sizecode = size
      for i = 1, size do
        func.code[i] = LoadBlock(config.size_Instruction)
      end
    end

    -------------------------------------------------------------
    -- body of LoadFunction() starts here
    -------------------------------------------------------------
    -- statistics handler
    local start = idx
    func.stat = {}
    local function SetStat(item)
      func.stat[item] = idx - start
      start = idx
    end
    -- source file name
    func.source = LoadString()
    func.pos_source = previdx
    if func.source == "" and level == 1 then func.source = funcname end
    -- line where the function was defined
    func.linedefined = LoadInt()
    func.pos_linedefined = previdx
    func.lastlinedefined = LoadInt()

    -------------------------------------------------------------
    -- some byte counts
    -------------------------------------------------------------
    if TestChunk(4, idx, "function header") then return end
    func.nups = LoadByte()
    func.numparams = LoadByte()
    func.is_vararg = LoadByte()
    func.maxstacksize = LoadByte()
    SetStat("header")

    -------------------------------------------------------------
    -- these are lists, LoadConstantPs() may be recursive
    -------------------------------------------------------------
    -- load parts of a chunk (rearranged in 5.1)
    LoadCode()       SetStat("code")
    LoadConstantKs() SetStat("consts")
    LoadConstantPs() SetStat("funcs")
    LoadLines()      SetStat("lines")
    LoadLocals()     SetStat("locals")
    LoadUpvalues()   SetStat("upvalues")
    return func
    -- end of LoadFunction
  end

  ---------------------------------------------------------------
  -- displays function information
  -- * decoupled from LoadFunction due to 5.1 chunk rearrangement
  ---------------------------------------------------------------
  function DescFunction(func, num, level)
    -------------------------------------------------------------
    -- brief display mode with indentation style option
    -------------------------------------------------------------
    local function BriefLine(desc)
      if not config.DISPLAY_FLAG or not config.DISPLAY_BRIEF then return end
      if DISPLAY_INDENT then
        WriteLine(string.rep(config.DISPLAY_SEP, level - 1)..desc)
      else
        WriteLine(desc)
      end
    end

    -------------------------------------------------------------
    -- describe a string (size, data pairs)
    -------------------------------------------------------------
    local function DescString(s, pos)
      local len = string.len(s or "")
      if len > 0 then 
        len = len + 1   -- add the NUL back
        s = s.."\0"     -- was removed by LoadString
      end
      FormatLine(config.size_size_t, string.format("string size (%s)", len), pos)
      if len == 0 then return end
      pos = pos + config.size_size_t
      if len <= config.WIDTH_HEX then
        FormatLine(len, EscapeString(s, 1), pos)
      else
        -- split up long strings nicely, easier to view
        while len > 0 do
          local seg_len = config.WIDTH_HEX
          if len < seg_len then seg_len = len end
          local seg = string.sub(s, 1, seg_len)
          s = string.sub(s, seg_len + 1)
          len = len - seg_len
          FormatLine(seg_len, EscapeString(seg, 1), pos, len > 0)
          pos = pos + seg_len
        end
      end
    end

    -------------------------------------------------------------
    -- describe line information
    -------------------------------------------------------------
    local function DescLines()
      local size = func.sizelineinfo
      local pos = func.pos_lineinfo
      DescLine("* lines:")
      FormatLine(config.size_int, "sizelineinfo ("..size..")", pos)
      pos = pos + config.size_int
      local WIDTH = WidthOf(size)
      DescLine("[pc] (line)")
      for i = 1, size do
        local s = string.format("[%s] (%s)", ZeroPad(i, WIDTH), func.lineinfo[i])
        FormatLine(config.size_int, s, pos)
        pos = pos + config.size_int
      end
      -- mark significant lines in source listing
      SourceMark(func)
    end

    -------------------------------------------------------------
    -- describe locals information
    -------------------------------------------------------------
    local function DescLocals()
      local n = func.sizelocvars
      DescLine("* locals:")
      FormatLine(config.size_int, "sizelocvars ("..n..")", func.pos_locvars)
      for i = 1, n do
        local locvar = func.locvars[i]
        DescString(locvar.varname, locvar.pos_varname)
        DescLine("local ["..(i - 1).."]: "..EscapeString(locvar.varname))
        BriefLine(".local"..config.DISPLAY_SEP..EscapeString(locvar.varname, 1)
                  ..config.DISPLAY_SEP..config.DISPLAY_COMMENT..(i - 1))
        FormatLine(config.size_int, "  startpc ("..locvar.startpc..")", locvar.pos_startpc)
        FormatLine(config.size_int, "  endpc   ("..locvar.endpc..")",locvar.pos_endpc)
      end
    end

    -------------------------------------------------------------
    -- describe upvalues information
    -------------------------------------------------------------
    local function DescUpvalues()
      local n = func.sizeupvalues
      DescLine("* upvalues:")
      FormatLine(config.size_int, "sizeupvalues ("..n..")", func.pos_upvalues)
      for i = 1, n do
        local upvalue = func.upvalues[i]
        DescString(upvalue, func.posupvalues[i])
        DescLine("upvalue ["..(i - 1).."]: "..EscapeString(upvalue))
        BriefLine(".upvalue"..config.DISPLAY_SEP..EscapeString(upvalue, 1)
                  ..config.DISPLAY_SEP..config.DISPLAY_COMMENT..(i - 1))
      end
    end

    -------------------------------------------------------------
    -- describe constants information (data)
    -------------------------------------------------------------
    local function DescConstantKs()
      local n = func.sizek
      local pos = func.pos_ks
      DescLine("* constants:")
      FormatLine(config.size_int, "sizek ("..n..")", pos)
      for i = 1, n do
        local posk = func.posk[i]
        local CONST = "const ["..(i - 1).."]: "
        local CONSTB = config.DISPLAY_SEP..config.DISPLAY_COMMENT..(i - 1)
        local k = func.k[i]
        if type(k) == "number" then
          FormatLine(1, "const type "..config.LUA_TNUMBER, posk)
          FormatLine(config.size_lua_Number, CONST.."("..k..")", posk + 1)
          BriefLine(".const"..config.DISPLAY_SEP..k..CONSTB)
        elseif type(k) == "boolean" then
          FormatLine(1, "const type "..config.LUA_TBOOLEAN, posk)
          FormatLine(1, CONST.."("..tostring(k)..")", posk + 1)
          BriefLine(".const"..config.DISPLAY_SEP..tostring(k)..CONSTB)
        elseif type(k) == "string" then
          FormatLine(1, "const type "..config.LUA_TSTRING, posk)
          DescString(k, posk + 1)
          DescLine(CONST..EscapeString(k, 1))
          BriefLine(".const"..config.DISPLAY_SEP..EscapeString(k, 1)..CONSTB)
        elseif type(k) == "nil" then
          FormatLine(1, "const type "..config.LUA_TNIL, posk)
          DescLine(CONST.."nil")
          BriefLine(".const"..config.DISPLAY_SEP.."nil"..CONSTB)
        end
      end--for
    end

    -------------------------------------------------------------
    -- describe constants information (local functions)
    -------------------------------------------------------------
    local function DescConstantPs()
      local n = func.sizep
      DescLine("* functions:")
      FormatLine(config.size_int, "sizep ("..n..")", func.pos_ps)
      for i = 1, n do
        -- recursive call back on itself, next level
        DescFunction(func.p[i], i - 1, level + 1)
      end
    end

    -------------------------------------------------------------
    -- describe function code
    -- * inst decode subfunctions: DecodeInst() and DescribeInst()
    -------------------------------------------------------------
    local function DescCode()
      local size = func.sizecode
      local pos = func.pos_code
      DescLine("* code:")
      FormatLine(config.size_int, "sizecode ("..size..")", pos)
      pos = pos + config.size_int
      func.inst = {}
      local ISIZE = WidthOf(size)
      for i = 1, size do
        func.inst[i] = {}
      end
      for i = 1, size do
        DecodeInst(func.code[i], func.inst[i])
        local inst = func.inst[i]
        -- compose instruction: opcode operands [; comments]
        local d = DescribeInst(inst, i, func)
        d = string.format("[%s] %s", ZeroPad(i, ISIZE), d)
        -- source code insertion
        SourceMerge(func, i)
        FormatLine(config.size_Instruction, d, pos)
        BriefLine(d)
        pos = pos + config.size_Instruction
      end
    end

    -------------------------------------------------------------
    -- body of DescFunction() starts here
    -------------------------------------------------------------
    DescLine("")
    BriefLine("")
    FormatLine(0, "** function ["..num.."] definition (level "..level..")",
               func.pos_source)
    BriefLine("; function ["..num.."] definition (level "..level..")")
    DescLine("** start of function **")

    -- source file name
    DescString(func.source, func.pos_source)
    if func.source == nil then
      DescLine("source name: (none)")
    else
      DescLine("source name: "..EscapeString(func.source))
    end

    -- optionally initialize source listing merging
    SourceInit(func.source)

    -- line where the function was defined
    local pos = func.pos_linedefined
    FormatLine(config.size_int, "line defined ("..func.linedefined..")", pos)
    pos = pos + config.size_int
    FormatLine(config.size_int, "last line defined ("..func.lastlinedefined..")", pos)
    pos = pos + config.size_int

    -- display byte counts
    FormatLine(1, "nups ("..func.nups..")", pos)
    FormatLine(1, "numparams ("..func.numparams..")", pos + 1)
    FormatLine(1, "is_vararg ("..func.is_vararg..")", pos + 2)
    FormatLine(1, "maxstacksize ("..func.maxstacksize..")", pos + 3)
    BriefLine(string.format("; %d upvalues, %d params, %d stacks",
      func.nups, func.numparams, func.maxstacksize))
    BriefLine(string.format(".function%s%d %d %d %d", config.DISPLAY_SEP,
      func.nups, func.numparams, func.is_vararg, func.maxstacksize))

    -- display parts of a chunk
    if config.DISPLAY_FLAG and config.DISPLAY_BRIEF then
      DescLines()       -- brief displays 'declarations' first
      DescLocals()
      DescUpvalues()
      DescConstantKs()
      DescConstantPs()
      DescCode()
    else
      DescCode()        -- normal displays positional order
      DescConstantKs()
      DescConstantPs()
      DescLines()
      DescLocals()
      DescUpvalues()
    end

    -- show function statistics block
    DisplayStat("* func header   = "..func.stat.header.." bytes")
    DisplayStat("* lines size    = "..func.stat.lines.." bytes")
    DisplayStat("* locals size   = "..func.stat.locals.." bytes")
    DisplayStat("* upvalues size = "..func.stat.upvalues.." bytes")
    DisplayStat("* consts size   = "..func.stat.consts.." bytes")
    DisplayStat("* funcs size    = "..func.stat.funcs.." bytes")
    DisplayStat("* code size     = "..func.stat.code.." bytes")
    func.stat.total = func.stat.header + func.stat.lines +
                      func.stat.locals + func.stat.upvalues +
                      func.stat.consts + func.stat.funcs +
                      func.stat.code
    DisplayStat("* TOTAL size    = "..func.stat.total.." bytes")
    DescLine("** end of function **\n")
    BriefLine("; end of function\n")
  end

  ---------------------------------------------------------------
  -- actual call to start the function loading process
  ---------------------------------------------------------------
  result.func = LoadFunction("(chunk)", 0, 1)
  DescFunction(result.func, 0, 1)
  stat.total = idx - 1
  DisplayStat("* TOTAL size = "..stat.total.." bytes")
  result.stat = stat
  FormatLine(0, "** end of chunk **", idx)
  return result
  -- end of ChunkSpy
end

--[[-------------------------------------------------------------------
-- Writes out a binary chunk as a string or returns it
-- * writer generally assumes the set configuration is good
-- * TODO add tests to ensure that binary chunk rules are followed
--]]-------------------------------------------------------------------

function WriteBinaryChunk(parsed, tofile)
  local Buffer = {}

  -- setup for binary file I/O
  if tofile then
    if not config.OUTPUT_FILE then
      error("must specify an output filename for rewrites")
    else -- a kludge
      WriteLine = function(s) config.OUTPUT_FILE:write(s) end
    end
  end

  ---------------------------------------------------------------
  -- output functions
  ---------------------------------------------------------------
  local function Dump(s)
    if tofile then WriteLine(s) else table.insert(Buffer, s) end
  end
  local function DumpByte(b)
    Dump(string.char(b))
  end
  ---------------------------------------------------------------
  -- writes a block of bytes to little/big-endian output
  ---------------------------------------------------------------
  local function WriteBlock(v)
    if config.endianness == 1 then
      Dump(v)
    else-- reverse bytes if big endian
      Dump(string.reverse(v))
    end
  end

  ---------------------------------------------------------------
  -- write header
  ---------------------------------------------------------------
  Dump(config.SIGNATURE)
  DumpByte(config.VERSION)
  DumpByte(config.FORMAT)
  DumpByte(config.endianness)
  DumpByte(config.size_int)     -- byte sizes
  DumpByte(config.size_size_t)
  DumpByte(config.size_Instruction)
  DumpByte(config.size_lua_Number)
  DecodeInit()
  DumpByte(config.integral)
  -- no more test number in 5.1

  ---------------------------------------------------------------
  -- recursively called to write function data
  ---------------------------------------------------------------
  local function WriteFunction(func)
    -------------------------------------------------------------
    -- writes an unsigned integer (for integers, size_ts)
    -- * unsigned because the relevant data is always positive
    -------------------------------------------------------------
    local function WriteUnsigned(num, type_size)
      if not type_size then type_size = config.size_int end
      local v = ""
      for i = 1, type_size do
        v = v..string.char(num % 256); num = math.floor(num / 256)
      end
      WriteBlock(v)
    end

    -------------------------------------------------------------
    -- writes a number (lua_Number type)
    -------------------------------------------------------------
    local function WriteNumber(num)
      local convert_func = convert_to[config.number_type]
      if not convert_func then
        error("could not find conversion function for lua_Number")
      end
      WriteBlock(convert_func(num))
    end

    -------------------------------------------------------------
    -- writes a string
    -------------------------------------------------------------
    local function WriteString(str)
      if not str then
        WriteUnsigned(0, config.size_size_t)
        return
      end
      str = str.."\0"   -- mandatory NUL termination
      WriteUnsigned(string.len(str), config.size_size_t)
      Dump(str)
    end

    -------------------------------------------------------------
    -- write line information
    -------------------------------------------------------------
    local function WriteLines()
      WriteUnsigned(func.sizelineinfo)
      for i = 1, func.sizelineinfo do WriteUnsigned(func.lineinfo[i]) end
    end

    -------------------------------------------------------------
    -- write locals information
    -------------------------------------------------------------
    local function WriteLocals()
      WriteUnsigned(func.sizelocvars)
      for i = 1, func.sizelocvars do
        local locvar = func.locvars[i]
        WriteString(locvar.varname)
        WriteUnsigned(locvar.startpc)
        WriteUnsigned(locvar.endpc)
      end
    end

    -------------------------------------------------------------
    -- write upvalues information
    -------------------------------------------------------------
    local function WriteUpvalues()
      -- func.sizeupvalues == func.nups
      WriteUnsigned(func.sizeupvalues)
      for i = 1, func.sizeupvalues do WriteString(func.upvalues[i]) end
    end

    -------------------------------------------------------------
    -- write constants information (data)
    -------------------------------------------------------------
    local function WriteConstantKs()
      WriteUnsigned(func.sizek)
      for i = 1, func.sizek do
        local v = func.k[i]
        if type(v) == "number" then
          DumpByte(config.LUA_TNUMBER); WriteNumber(v)
        elseif type(v) == "boolean" then
          local b = 0; if v then b = 1 end
          DumpByte(config.LUA_TBOOLEAN); DumpByte(b)
        elseif type(v) == "string" then
          DumpByte(config.LUA_TSTRING); WriteString(v)
        elseif type(v) == "nil" then
          DumpByte(config.LUA_TNIL)
        else
          error("bad constant type \""..type(v).."\" at "..i)
        end
      end--for
    end

    -------------------------------------------------------------
    -- write constants information (local functions)
    -------------------------------------------------------------
    local function WriteConstantPs()
      WriteUnsigned(func.sizep)
      for i = 1, func.sizep do WriteFunction(func.p[i]) end
    end

    -------------------------------------------------------------
    -- write function code
    -------------------------------------------------------------
    local function WriteCode()
      WriteUnsigned(func.sizecode)
      for i = 1, func.sizecode do WriteBlock(EncodeInst(func.inst[i])) end
    end

    -------------------------------------------------------------
    -- body of WriteFunction() starts here
    -------------------------------------------------------------
    WriteString(func.source)
    WriteUnsigned(func.linedefined)
    WriteUnsigned(func.lastlinedefined)
    DumpByte(func.nups)                 -- some byte counts
    DumpByte(func.numparams)
    DumpByte(func.is_vararg)
    DumpByte(func.maxstacksize)
    WriteCode()
    WriteConstantKs()
    WriteConstantPs()   -- may be recursive
    WriteLines()        -- these are lists
    WriteLocals()
    WriteUpvalues()
    -- end of WriteFunction
  end

  ---------------------------------------------------------------
  -- actual call to start the function writing process
  ---------------------------------------------------------------
  WriteFunction(parsed.func)
  if not tofile then return table.concat(Buffer) end
end

--[[-------------------------------------------------------------------
-- ChunkSpy internal tests
-- * not very comprehensive at the moment, more useful during dev...
-- * to make it more chatty, set config.VERBOSE_TEST to true
--]]-------------------------------------------------------------------

function ChunkSpy_Test()
  ---------------------------------------------------------------
  -- In A.D. 2101
  -- War was beginning.
  ---------------------------------------------------------------
  local FAIL, SUCCEED = false, true
  local GotError = false
  -- force to x86_standard because test data follows this
  SetProfile("x86 standard")
  config.DISPLAY_FLAG = false           -- don't show listing
  config.AUTO_DETECT = false
  print(title)

  ---------------------------------------------------------------
  -- Captain: What happen ?
  ---------------------------------------------------------------
  local function expected(sample, outcome, errmatch, message)
    local ok, msg = pcall(ChunkSpy, "test", sample)
    -- deduce outcome
    if outcome == SUCCEED and not ok then
      print("ChunkSpy_Test: failed instead of success!\nTest was for: "..message)
      GotError = true; return
    elseif outcome == FAIL and ok then
      print("ChunkSpy_Test: success instead of failed!\nTest was for: "..message)
      GotError = true; return
    elseif outcome == FAIL and not ok then
      if not string.find(msg, errmatch, 1, 1) then
        print("ChunkSpy_Test: wrong error message returned!\nTest was for: "
              ..message.."\nError returned: "..msg)
        GotError = true; return
      end
    end
    if config.VERBOSE_TEST then
      print("ChunkSpy_Test: successful test!\nTest was for: "..message)
    end
  end

  ---------------------------------------------------------------
  -- Mechanic: Somebody set up us the bomb.
  ---------------------------------------------------------------
  expected("\0\0\0\0", FAIL,
    "header signature not found", "incorrect header signature")

  ---------------------------------------------------------------
  -- Operator: We get signal.
  -- Captain: What !
  ---------------------------------------------------------------
  expected("\27Lua\64", FAIL,
    "cannot read version", "incorrect version byte")
  expected("\27Lua\81\1", FAIL,
    "cannot read format", "incorrect format byte")

  ---------------------------------------------------------------
  -- Operator: Main screen turn on.
  -- Captain: It's you !!
  ---------------------------------------------------------------
  expected("\27Lua\81\0\0", FAIL,
    "unsupported endianness", "incorrect endianness byte")

  ---------------------------------------------------------------
  -- Cats: How are you gentlemen !!
  -- Cats: All your base are belong to us.
  -- Cats: You are on the way to destruction.
  ---------------------------------------------------------------
  expected("\27Lua\81\0\1\0\0\0\0", FAIL,
    "int size", "incorrect int size byte")
  expected("\27Lua\81\0\1\4\0\0\0", FAIL,
    "size_t size", "incorrect size_t size byte")
  expected("\27Lua\81\0\1\4\4\0\0", FAIL,
    "Instruction size", "incorrect Instruction size byte")
  expected("\27Lua\81\0\1\4\4\4\0", FAIL,
    "number size", "incorrect lua_Number size byte")

  ---------------------------------------------------------------
  -- Captain: What you say !!
  -- Cats: You have no chance to survive make your time.
  -- Cats: Ha Ha Ha Ha ....
  ---------------------------------------------------------------
  expected("\27Lua\81\0\1\4\4\4\8\1", FAIL,
    "incorrect lua_Number", "incorrect integral byte")

  ---------------------------------------------------------------
  -- Operator: Captain '!!'*
  -- Captain: Take off every 'Zig'!!
  -- Captain: You know what you doing.
  -- Captain: Move 'Zig'.
  ---------------------------------------------------------------
  local LUA_HEADER = "\27Lua\81\0\1\4\4\4\8\1"
  -- add more tests here

  ---------------------------------------------------------------
  -- Captain: For great justice.
  ---------------------------------------------------------------
  if not GotError then
    print("ChunkSpy_Test: completed simple tests without errors")
  end
end

--[[-------------------------------------------------------------------
-- ChunkSpy sample generator
-- * try to exercise the code, especially instruction decoding
-- * currently, the following opcodes are not generated:
--   SELF, SUB, MUL, DIV, POW, NOT, LT, LE, TEST, TAILCALL, CLOSE
-- * the code is nonsensical, don't try to run it!!!
-- * check correctness by visual inspection...
--]]-------------------------------------------------------------------

function ChunkSpy_Sample()
  local LUA_SAMPLE = string.dump(
    function()
      local a = 1; b = "the quick brown fox\r\n"
      function c() b = a a = b end
      c = nil; c = -a; c = not b
      for i = 1, 10 do a = a + 2 c() end
      a = {}; a[1] = false; b = a[1]
      a = d..c..b; a = b == c; a = {1,2,}
      for i in b() do b = 1 end
      return
    end
  )
  local ok, msg = pcall(ChunkSpy, "test sample", LUA_SAMPLE)
  if not ok then
    print(title)
    print("* Test sample has failed with the following error:")
    print(msg)
  end
end

--[[-------------------------------------------------------------------
-- Top-level file/chunk handling, processes user's binary chunks
--]]-------------------------------------------------------------------

function ChunkSpy_DoFiles(files)
  local binary_chunks = {}
  ---------------------------------------------------------------
  -- pre-processing of file list
  ---------------------------------------------------------------
  for i, v in pairs(files) do
    local filename, binchunk
    if type(i) == "number" then -- normally specified files
      filename = v
      local INF = io.open(filename, "rb")
      if not INF then
        error("cannot open \""..filename.."\" for reading")
      end
      binchunk = INF:read("*a")
      io.close(INF)
    else -- binary chunk supplied by --source, after compilation
      filename = i
      binchunk = v
    end
    if binchunk then
      local sig = string.sub(binchunk, 1, string.len(config.SIGNATURE))
      -- identify all binary chunks via signature
      if sig == config.SIGNATURE then
        -- duplicate filenames eliminated here
        binary_chunks[filename] = binchunk
      else
        -- may be a source code listing
        table.insert(other_files, filename)
      end
    end
  end
  ---------------------------------------------------------------
  -- per-chunk processing
  ---------------------------------------------------------------
  local done
  for i,v in pairs(binary_chunks) do
    if done and (config.REWRITE_FLAG or config.RUN_FLAG) then
      error("can rewrite or run only one file at a time")
    end
    -- returns parsed table, for further optional processing
    local result = ChunkSpy(i, v); done = true
    -------------------------------------------------------------
    -- write out a binary chunk option
    -------------------------------------------------------------
    if config.REWRITE_FLAG then
      if not SetProfile(config.REWRITE_PROFILE) then
        error("could not load profile for writing binary chunk")
      end
      if files[i] then
        -- force --source consistency with luac output
        if string.sub(result.func.source, 1, 1) ~= "@" then
          result.func.source = "@"..result.func.source
        end
      end
      WriteBinaryChunk(result, true)
    -------------------------------------------------------------
    -- run a binary chunk option
    -- * global environment is inherited if read, quite dangerous
    -------------------------------------------------------------
    elseif config.RUN_FLAG then
      if not SetProfile("local") then
        error("could not load profile for writing binary chunk")
      end
      local binchunk = WriteBinaryChunk(result)
      local func, msg = loadstring(binchunk, i) -- load
      if not func then error(msg) end
      local sandbox = {}
      arg_other[0] = i                      -- propagate rest of args
      arg = arg_other
      setmetatable(sandbox, {__index = _G}) -- sandbox (see PIL book)
      setfenv(func, sandbox)
      func()                                -- execute
      return
    end
  end
  if not done then
    print(title) print("ChunkSpy: no binary chunks processed!")
  end
end

--[[-------------------------------------------------------------------
-- ChunkSpy interactive mode; instant feedback!
--]]-------------------------------------------------------------------

function ChunkSpy_Interact()
  config.DISPLAY_BRIEF = true
  config.OUTPUT_FILE = nil
  local prevline, done
  print(title)
  print(interactive_help)
  while not done do
    if prevline then io.stdout:write(">>") else io.stdout:write(">") end
    io.stdout:flush()
    local l = io.stdin:read("*l")
    -------------------------------------------------------------
    if l == nil or (l == "exit" or l == "quit" and not prevline) then
      done = true
    -------------------------------------------------------------
    elseif l == "help" and not prevline then
      io.stdout:write(interactive_help, "\n")
    -------------------------------------------------------------
    -- handle line continuation
    -------------------------------------------------------------
    elseif string.sub(l, -1, -1) == "\\" then
      if not prevline then prevline = "" end
      prevline = prevline..string.sub(l, 1, -2)
    -------------------------------------------------------------
    -- compose source chunk, compile, disassemble
    -------------------------------------------------------------
    else
      if prevline then l = prevline..l; prevline = nil end
      local func, msg = loadstring(l, "(interactive mode)")
      if not func then
        print("ChunkSpy: failed to compile your input")
      else
        binchunk = string.dump(func)
        ChunkSpy("(interactive mode)", binchunk)
      end
    -------------------------------------------------------------
    end--if l
  end--while
end

--[[-------------------------------------------------------------------
-- loads a Lua source file and tries to compile it using loadstring()
-- * integration with ChunkSpy_DoFiles() is a little messy...
--]]-------------------------------------------------------------------

function CompileSourceFile(filename)
  local INF = io.open(filename, "rb")
  if not INF then
    error("cannot open \""..filename.."\" for reading")
  end
  local src = INF:read("*a")
  local func, msg = loadstring(src, filename)
  if not func then
    print(msg)
    error("failed to compile source file \""..filename.."\"")
  end
  io.close(INF)
  return string.dump(func)
end

--[[-------------------------------------------------------------------
-- Command-line interface
--]]-------------------------------------------------------------------

function main()
  ---------------------------------------------------------------
  -- arg[0] is not set if ChunkSpy.lua is embedded, for ChunkSpy.c
  ---------------------------------------------------------------
  local usage, exec
  if arg[0] then exec = "lua ChunkSpy.lua" else exec = "ChunkSpy" end
  usage = string.format(USAGE, exec, exec)
  ---------------------------------------------------------------
  -- check Lua version
  ---------------------------------------------------------------
  if _VERSION ~= "Lua 5.1" then
    error("this version of ChunkSpy requires Lua 5.1")
  end
  ---------------------------------------------------------------
  -- handle arguments
  ---------------------------------------------------------------
  if not arg[1] then
    print(title) print(usage)
  else
    local i, perform, gotfile = 1
    local files = {}
    while arg[i] do
      local a, b = arg[i], arg[i + 1]
      if string.sub(a, 1, 1) == "-" then        -- handle options here
        ---------------------------------------------------------
        if a == "--test" then
          perform = ChunkSpy_Test
        elseif a == "--sample" then
          perform = ChunkSpy_Sample
        elseif a == "-h" or a == "--help" then
          print(title) print(usage) return
        elseif a == "--stats" then
          config.STATS = true
        elseif a == "--auto" then
          config.AUTO_DETECT = true
        elseif a == "--brief" then
          config.DISPLAY_BRIEF = true
        elseif a == "--interact" then
          perform = ChunkSpy_Interact
        ---------------------------------------------------------
        elseif a == "-o" or a == "--source" then
          if not b then error("-o option needs a file name") end
          if a == "-o" then
            config.OUTPUT_FILE = b
          else
            local binchunk = CompileSourceFile(b)
            if binchunk then files[b] = binchunk; gotfile = true end
          end
          i = i + 1
        ---------------------------------------------------------
        elseif a == "--rewrite" then
          if not b then error("--rewrite option needs a profile name") end
          config.DISPLAY_FLAG = false
          config.REWRITE_FLAG = true
          if b == "local" or CONFIGURATION[b] then
            config.REWRITE_PROFILE = b
          else
            error("specified profile \""..b.."\"not found")
          end
          i = i + 1
        ---------------------------------------------------------
        elseif a == "--run" then
          config.DISPLAY_FLAG = false
          config.AUTO_DETECT = true
          config.RUN_FLAG = true
        ---------------------------------------------------------
        elseif a == "--" then
          local j = i + 1
          while arg[j] do
            table.insert(arg_other, arg[j])     -- gather rest of args
            j = j + 1
          end
          break
        ---------------------------------------------------------
        else
          error("unrecognized option "..a)
        end--if a
        ---------------------------------------------------------
      else
        table.insert(files, a); gotfile = true  -- potential filename
      end--if == "-"
      i = i + 1
    end--while
    -------------------------------------------------------------
    -- make calls to perform functions
    -- * OutputInit() and OutputExit() brackets listing output
    -------------------------------------------------------------
    OutputInit()
    if perform then
      perform()
    elseif gotfile then
      ChunkSpy_DoFiles(files)
    else
      print(title) print("ChunkSpy: nothing to do!")
    end
    OutputExit()
  end
end

-----------------------------------------------------------------------
-- program entry point
-----------------------------------------------------------------------
ok, msg = pcall(main)           -- call main() for proper traceback
if not ok then                  -- error
  print(title)
  print("* Run with option -h or --help for usage information")
  print(msg)
end

----end-of-script----
