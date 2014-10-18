@echo off
set BIN_PATH=..\bin
echo copying allopcodes.lua
copy /y %BIN_PATH%\allopcodes.lua allopcodes.lua
echo generating allopcodes.luac
%BIN_PATH%\luac -o allopcodes.luac allopcodes.lua
echo generating allopcodes_lua.h
%BIN_PATH%\lua %BIN_PATH%\bin2c.lua allopcodes.lua allopcodes_lua > allopcodes_lua.h
echo generating allopcodes_luac.h
%BIN_PATH%\lua %BIN_PATH%\bin2c.lua allopcodes.luac allopcodes_luac > allopcodes_luac.h
@echo on
