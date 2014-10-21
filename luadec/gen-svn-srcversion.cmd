@echo off
echo generating srcversion.h using "svnversion -n ."
svnversion -n .
(echo #ifndef LUADEC_SRCVERSION_H) > srcversion.h
(echo #define LUADEC_SRCVERSION_H) >> srcversion.h
(echo.) >> srcversion.h
(echo|set /p=#define SRCVERSION ^") >> srcversion.h
svnversion -n . >> srcversion.h
(echo ^") >> srcversion.h
(echo.) >> srcversion.h
(echo #endif // #ifndef LUADEC_SRCVERSION_H) >> srcversion.h
@echo on
