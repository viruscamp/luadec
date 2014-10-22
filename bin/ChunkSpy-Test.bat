set lua=%1
set chunkspy=%2

%lua% ..\ChunkSpy\%chunkspy%.lua --help
pause
%lua% ..\ChunkSpy\%chunkspy%.lua --test
pause
%lua% ..\ChunkSpy\%chunkspy%.lua --sample
pause
%lua% ..\ChunkSpy\%chunkspy%.lua --interact
pause

%lua% ..\ChunkSpy\%chunkspy%.lua --brief allopcodes.lua
pause
%lua% ..\ChunkSpy\%chunkspy%.lua --brief allopcodes.51.luac
pause
%lua% ..\ChunkSpy\%chunkspy%.lua --brief allopcodes.52.luac
pause

%lua% ..\ChunkSpy\%chunkspy%.lua --stats allopcodes.lua
pause
%lua% ..\ChunkSpy\%chunkspy%.lua --stats allopcodes.51.luac
pause
%lua% ..\ChunkSpy\%chunkspy%.lua --stats allopcodes.52.luac
pause

%lua% ..\ChunkSpy\%chunkspy%.lua allopcodes.lua
pause
%lua% ..\ChunkSpy\%chunkspy%.lua allopcodes.51.luac
pause
%lua% ..\ChunkSpy\%chunkspy%.lua allopcodes.52.luac
pause

%lua% ..\ChunkSpy\%chunkspy%.lua --run allopcodes.lua
pause
%lua% ..\ChunkSpy\%chunkspy%.lua --run allopcodes.51.luac
pause
%lua% ..\ChunkSpy\%chunkspy%.lua --run allopcodes.52.luac
pause

del allopcodes.rewrite.luac
%lua% ..\ChunkSpy\%chunkspy%.lua -o allopcodes.rewrite.luac --rewrite local allopcodes.lua
pause
%lua% ..\ChunkSpy\%chunkspy%.lua -o allopcodes.rewrite.luac --rewrite local allopcodes.51.luac
pause
%lua% ..\ChunkSpy\%chunkspy%.lua -o allopcodes.rewrite.luac --rewrite local allopcodes.52.luac
pause
fc /a /b allopcodes.rewrite.luac allopcodes.51.luac
pause
fc /a /b allopcodes.rewrite.luac allopcodes.52.luac
pause

del allopcodes.rewrite.luac
%lua% ..\ChunkSpy\%chunkspy%.lua -o allopcodes.rewrite.luac --rewrite "x86 standard" allopcodes.lua
pause
%lua% ..\ChunkSpy\%chunkspy%.lua -o allopcodes.rewrite.luac --rewrite "x86 standard" allopcodes.51.luac
pause
%lua% ..\ChunkSpy\%chunkspy%.lua -o allopcodes.rewrite.luac --rewrite "x86 standard" allopcodes.52.luac
pause
fc /a /b allopcodes.rewrite.luac allopcodes.51.luac
pause
fc /a /b allopcodes.rewrite.luac allopcodes.52.luac
pause
