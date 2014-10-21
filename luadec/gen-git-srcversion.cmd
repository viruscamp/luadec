@echo off
if not defined TERM (set TERM=msys)
echo generating srcversion.h using "git log -n 1 --format=format:%%%%h"
git log -n 1 --format=format:%%h%%n
(echo #ifndef LUADEC_SRCVERSION_H) > srcversion.h
(echo #define LUADEC_SRCVERSION_H) >> srcversion.h
(echo.) >> srcversion.h
(echo|set /p=#define SRCVERSION ^") >> srcversion.h
git log -n 1 --format=format:%%h >> srcversion.h
(echo ^") >> srcversion.h
(echo.) >> srcversion.h
(echo #endif // #ifndef LUADEC_SRCVERSION_H) >> srcversion.h
@echo on
