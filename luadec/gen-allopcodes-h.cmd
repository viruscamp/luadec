@echo off
set OUTDIR=%1
set LUAFILE=%2
echo copying %LUAFILE%
copy /y ..\bin\%LUAFILE% allopcodes.lua
echo generating allopcodes.luac
%OUTDIR%\luac -o allopcodes.luac allopcodes.lua
echo generating allopcodes_lua.h
%OUTDIR%\lua ..\bin\bin2c.lua allopcodes.lua allopcodes_lua > allopcodes_lua.h
echo generating allopcodes_luac.h
%OUTDIR%\lua ..\bin\bin2c.lua allopcodes.luac allopcodes_luac > allopcodes_luac.h
@echo on
