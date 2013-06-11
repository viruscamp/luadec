#pragma once
#ifndef LUADEC_COMMON_H
#define LUADEC_COMMON_H

#ifdef _DEBUG

#ifdef MEMCHECK_VLD
#include <wchar.h>
#include <vld.h>
#endif

#ifdef MEMCHECK_MEMWATCH
#define MEMWATCH
#define MW_STDIO
#include <string.h>
#include "memwatch.h"
#endif

#endif

#endif