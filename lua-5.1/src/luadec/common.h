#pragma once

#ifndef LUADEC_COMMON_H
#define LUADEC_COMMON_H

#ifdef _DEBUG

#if defined MEMCHECK_VLD
	#include <wchar.h>
	#include <vld.h>
#elif defined MEMCHECK_MEMWATCH
	#define MEMWATCH
	#define MW_STDIO
	#include <string.h>
	#include "memwatch.h"
#endif

#endif // #ifdef _DEBUG

#define MACRO_STR_RAW(tok) #tok
#define MACRO_STR(tok) MACRO_STR_RAW(tok)

#ifndef cast
	#define cast(t,exp) ((t)(exp))
#endif // #ifndef cast

#ifndef NULL
	#define NULL ((void *)0)
#endif // #ifndef NULL

#endif // #ifndef LUADEC_COMMON_H
