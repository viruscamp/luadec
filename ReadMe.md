Overview
========

LuaDec is a Lua decompiler for lua 5.1 , and experimental for lua 5.2 and 5.3.

It is based on Hisham Muhammad's luadec which targeted lua 5.0.x and LuaDec51 by Zsolt Sz. Sztupak.

LuaDec is free software and uses the same license as the original LuaDec.


Compiling
---------
```
git clone https://github.com/viruscamp/luadec
cd luadec
git submodule update --init lua-5.1
cd lua-5.1
make linux
cd ../luadec
make LUAVER=5.1
```

If you want to build it for lua 5.2 or 5.3 , just replace 5.1 above to 5.2 or 5.3.

There are also project files for vc2008, tested for vc2008 and vc2013.  
Before compiling, make sure there are correct sources in lua-5.1 , lua-5.2 or lua-5.3.


Usage
-----
* decompile lua binary file:  
  luadec abc.luac  
* decompile lua source file for testing and comparing:  
    luadec abc.lua  
* disassemble lua source or binary  
    luadec -dis abc.lua  
* -pn print nested functions structure, could be used by -fn  
```
luadec -pn test.lua
0
  0_0
    0_0_0
  0_1
```
* -f decompile only specific nested function  
    luadec -f 0_1 test.lua  
* -ns donot process sub functions  
    luadec -ns -f 0_1 test.lua  
* -fc perform a instruction-by-instruction compare for each function  
    luadec -fc test.lua  
outputs:  
-- function check pass 0  
-- function check fail 0_0 : cannot compile  
-- function check fail 0_1 :  different code size; sizecode org: 66, decompiled: 67, same: 47;   

There are some more options, usually for debug purposes, or for cases where the built in local guesser guesses wrong.
Use -h to get a complete list of usable parameters


Credits
-------

Original by Hisham Muhammad (http://luadec.luaforge.net)
 
Ongoing port to Lua 5.1 by Zsolt Sz. Sztupak (https://github.com/sztupy/luadec51/)

The internals of Lua5.1 was learned from Kein-Hong Man's A No-Frills Introduction to Lua 5.1 VM Instructions
