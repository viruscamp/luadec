/*
** MEMWATCH.H
** Nonintrusive ANSI C memory leak / overwrite detection
** Copyright (C) 1992-2002 Johan Lindh
** All rights reserved.
** Version 2.71
**
************************************************************************
**
** PURPOSE:
**
**  MEMWATCH has been written to allow guys and gals that like to
**  program in C a public-domain memory error control product.
**  I hope you'll find it's as advanced as most commercial packages.
**  The idea is that you use it during the development phase and
**  then remove the MEMWATCH define to produce your final product.
**  MEMWATCH is distributed in source code form in order to allow
**  you to compile it for your platform with your own compiler.
**  It's aim is to be 100% ANSI C, but some compilers are more stingy
**  than others. If it doesn't compile without warnings, please mail
**  me the configuration of operating system and compiler you are using
**  along with a description of how to modify the source, and the version
**  number of MEMWATCH that you are using.
**
************************************************************************

	This file is part of MEMWATCH.

    MEMWATCH is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    MEMWATCH is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with MEMWATCH; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

************************************************************************
**
** REVISION HISTORY:
**
** 920810 JLI   [1.00]
** 920830 JLI   [1.10 double-free detection]
** 920912 JLI   [1.15 mwPuts, mwGrab/Drop, mwLimit]
** 921022 JLI   [1.20 ASSERT and VERIFY]
** 921105 JLI   [1.30 C++ support and TRACE]
** 921116 JLI   [1.40 mwSetOutFunc]
** 930215 JLI   [1.50 modified ASSERT/VERIFY]
** 930327 JLI   [1.51 better auto-init & PC-lint support]
** 930506 JLI   [1.55 MemWatch class, improved C++ support]
** 930507 JLI   [1.60 mwTest & CHECK()]
** 930809 JLI   [1.65 Abort/Retry/Ignore]
** 930820 JLI   [1.70 data dump when unfreed]
** 931016 JLI   [1.72 modified C++ new/delete handling]
** 931108 JLI   [1.77 mwSetAssertAction() & some small changes]
** 940110 JLI   [1.80 no-mans-land alloc/checking]
** 940328 JLI   [2.00 version 2.0 rewrite]
**              Improved NML (no-mans-land) support.
**              Improved performance (especially for free()ing!).
**              Support for 'read-only' buffers (checksums)
**              ^^ NOTE: I never did this... maybe I should?
**              FBI (free'd block info) tagged before freed blocks
**              Exporting of the mwCounter variable
**              mwBreakOut() localizes debugger support
**              Allocation statistics (global, per-module, per-line)
**              Self-repair ability with relinking
** 950913 JLI   [2.10 improved garbage handling]
** 951201 JLI   [2.11 improved auto-free in emergencies]
** 960125 JLI   [X.01 implemented auto-checking using mwAutoCheck()]
** 960514 JLI   [2.12 undefining of existing macros]
** 960515 JLI   [2.13 possibility to use default new() & delete()]
** 960516 JLI   [2.20 suppression of file flushing on unfreed msgs]
** 960516 JLI   [2.21 better support for using MEMWATCH with DLL's]
** 960710 JLI   [X.02 multiple logs and mwFlushNow()]
** 960801 JLI   [2.22 merged X.01 version with current]
** 960805 JLI   [2.30 mwIsXXXXAddr() to avoid unneeded GP's]
** 960805 JLI   [2.31 merged X.02 version with current]
** 961002 JLI   [2.32 support for realloc() + fixed STDERR bug]
** 961222 JLI   [2.40 added mwMark() & mwUnmark()]
** 970101 JLI   [2.41 added over/underflow checking after failed ASSERT/VERIFY]
** 970113 JLI   [2.42 added support for PC-Lint 7.00g]
** 970207 JLI   [2.43 added support for strdup()]
** 970209 JLI   [2.44 changed default filename to lowercase]
** 970405 JLI   [2.45 fixed bug related with atexit() and some C++ compilers]
** 970723 JLI   [2.46 added MW_ARI_NULLREAD flag]
** 970813 JLI   [2.47 stabilized marker handling]
** 980317 JLI   [2.48 ripped out C++ support; wasn't working good anyway]
** 980318 JLI   [2.50 improved self-repair facilities & SIGSEGV support]
** 980417 JLI	[2.51 more checks for invalid addresses]
** 980512 JLI	[2.52 moved MW_ARI_NULLREAD to occur before aborting]
** 990112 JLI	[2.53 added check for empty heap to mwIsOwned]
** 990217 JLI	[2.55 improved the emergency repairs diagnostics and NML]
** 990224 JLI	[2.56 changed ordering of members in structures]
** 990303 JLI	[2.57 first maybe-fixit-for-hpux test]
** 990516 JLI	[2.58 added 'static' to the definition of mwAutoInit]
** 990517 JLI	[2.59 fixed some high-sensitivity warnings]
** 990610 JLI	[2.60 fixed some more high-sensitivity warnings]
** 990715 JLI	[2.61 changed TRACE/ASSERT/VERIFY macro names]
** 991001 JLI	[2.62 added CHECK_BUFFER() and mwTestBuffer()]
** 991007 JLI	[2.63 first shot at a 64-bit compatible version]
** 991009 JLI	[2.64 undef's strdup() if defined, mwStrdup made const]
** 000704 JLI	[2.65 added some more detection for 64-bits]
** 010502 JLI   [2.66 incorporated some user fixes]
**              [mwRelink() could print out garbage pointer (thanks mac@phobos.ca)]
**				[added array destructor for C++ (thanks rdasilva@connecttel.com)]
**				[added mutex support (thanks rdasilva@connecttel.com)]
** 010531 JLI	[2.67 fix: mwMutexXXX() was declared even if MW_HAVE_MUTEX was not defined]
** 010619 JLI	[2.68 fix: mwRealloc() could leave the mutex locked]
** 020918 JLI	[2.69 changed to GPL, added C++ array allocation by Howard Cohen]
** 030212 JLI	[2.70 mwMalloc() bug for very large allocations (4GB on 32bits)]
** 030520 JLI	[2.71 added ULONG_LONG_MAX as a 64-bit detector (thanks Sami Salonen)]
**
** To use, simply include 'MEMWATCH.H' as a header file,
** and add MEMWATCH.C to your list of files, and define the macro
** 'MEMWATCH'. If this is not defined, MEMWATCH will disable itself.
**
** To call the standard C malloc / realloc / calloc / free; use mwMalloc_(),
** mwCalloc_() and mwFree_(). Note that mwFree_() will correctly
** free both malloc()'d memory as well as mwMalloc()'d.
**
** 980317: C++ support has been disabled.
**         The code remains, but is not compiled.
**
**         For use with C++, which allows use of inlining in header files
**         and class specific new/delete, you must also define 'new' as
**         'mwNew' and 'delete' as 'mwDelete'. Do this *after* you include
**         C++ header files from libraries, otherwise you can mess up their
**         class definitions. If you don't define these, the C++ allocations
**         will not have source file and line number information. Also note,
**         most C++ class libraries implement their own C++ memory management,
**         and don't allow anyone to override them. MFC belongs to this crew.
**         In these cases, the only thing to do is to use MEMWATCH_NOCPP.
**
** You can capture output from MEMWATCH using mwSetOutFunc().
** Just give it the adress of a "void myOutFunc(int c)" function,
** and all characters to be output will be redirected there.
**
** A failing ASSERT() or VERIFY() will normally always abort your
** program. This can be changed using mwSetAriFunc(). Give it a
** pointer to a "int myAriFunc(const char *)" function. Your function
** must ask the user whether to Abort, Retry or Ignore the trap.
** Return 2 to Abort, 1 to Retry or 0 to Ignore. Beware retry; it
** causes the expression to be evaluated again! MEMWATCH has a
** default ARI handler. It's disabled by default, but you can enable
** it by calling 'mwDefaultAri()'. Note that this will STILL abort
** your program unless you define MEMWATCH_STDIO to allow MEMWATCH
** to use the standard C I/O streams. Also, setting the ARI function
** will cause MEMWATCH *NOT* to write the ARI error to stderr. The
** error string is passed to the ARI function instead, as the
** 'const char *' parameter.
**
** You can disable MEMWATCH's ASSERT/VERIFY and/or TRACE implementations.
** This can be useful if you're using a debug terminal or smart debugger.
** Disable them by defining MW_NOASSERT, MW_NOVERIFY or MW_NOTRACE.
**
** MEMWATCH fills all allocated memory with the byte 0xFE, so if
** you're looking at erroneous data which are all 0xFE:s, the
** data probably was not initialized by you. The exception is
** calloc(), which will fill with zero's. All freed buffers are
** zapped with 0xFD. If this is what you look at, you're using
** data that has been freed. If this is the case, be aware that
** MEMWATCH places a 'free'd block info' structure immediately
** before the freed data. This block contains info about where
** the block was freed. The information is in readable text,
** in the format "FBI<counter>filename(line)", for example:
** "FBI<267>test.c(12)". Using FBI's slows down free(), so it's
** disabled by default. Use mwFreeBufferInfo(1) to enable it.
**
** To aid in tracking down wild pointer writes, MEMWATCH can perform
** no-mans-land allocations. No-mans-land will contain the byte 0xFC.
** MEMWATCH will, when this is enabled, convert recently free'd memory
** into NML allocations.
**
** MEMWATCH protects it's own data buffers with checksums. If you
** get an internal error, it means you're overwriting wildly,
** or using an uninitialized pointer.
**
************************************************************************
**
** Note when compiling with Microsoft C:
**  -   MSC ignores fflush() by default. This is overridden, so that
**      the disk log will always be current.
**
** This utility has been tested with:
**  PC-lint 7.0k, passed as 100% ANSI C compatible
**  Microsoft Visual C++ on Win16 and Win32
**  Microsoft C on DOS
**  SAS C on an Amiga 500
**  Gnu C on a PC running Red Hat Linux
**  ...and using an (to me) unknown compiler on an Atari machine.
**
************************************************************************
**
** Format of error messages in MEMWATCH.LOG:
**  message: <sequence-number> filename(linenumber), information
**
** Errors caught by MemWatch, when they are detected, and any
** actions taken besides writing to the log file MEMWATCH.LOG:
**
**  Double-freeing:
**      A pointer that was recently freed and has not since been
**      reused was freed again. The place where the previous free()
**      was executed is displayed.
**      Detect: delete or free() using the offending pointer.
**      Action: The delete or free() is cancelled, execution continues.
**  Underflow:
**      You have written just ahead of the allocated memory.
**      The size and place of the allocation is displayed.
**      Detect: delete or free() of the damaged buffer.
**      Action: The buffer is freed, but there may be secondary damage.
**  Overflow:
**      Like underflow, but you've written after the end of the buffer.
**      Detect: see Underflow.
**      Action: see Underflow.
**  WILD free:
**      An unrecognized pointer was passed to delete or free().
**      The pointer may have been returned from a library function;
**      in that case, use mwFree_() to force free() of it.
**      Also, this may be a double-free, but the previous free was
**      too long ago, causing MEMWATCH to 'forget' it.
**      Detect: delete or free() of the offending pointer.
**      Action: The delete or free() is cancelled, execution continues.
**  NULL free:
**      It's unclear to me whether or not freeing of NULL pointers
**      is legal in ANSI C, therefore a warning is written to the log file,
**      but the error counter remains the same. This is legal using C++,
**      so the warning does not appear with delete.
**      Detect: When you free(NULL).
**      Action: The free() is cancelled.
**  Failed:
**      A request to allocate memory failed. If the allocation is
**      small, this may be due to memory depletion, but is more likely
**      to be memory fragmentation problems. The amount of memory
**      allocated so far is displayed also.
**      Detect: When you new, malloc(), realloc() or calloc() memory.
**      Action: NULL is returned.
**  Realloc:
**      A request to re-allocate a memory buffer failed for reasons
**      other than out-of-memory. The specific reason is shown.
**      Detect: When you realloc()
**      Action: realloc() is cancelled, NULL is returned
**  Limit fail:
**      A request to allocate memory failed since it would violate
**      the limit set using mwLimit(). mwLimit() is used to stress-test
**      your code under simulated low memory conditions.
**      Detect: At new, malloc(), realloc() or calloc().
**      Action: NULL is returned.
**  Assert trap:
**      An ASSERT() failed. The ASSERT() macro works like C's assert()
**      macro/function, except that it's interactive. See your C manual.
**      Detect: On the ASSERT().
**      Action: Program ends with an advisory message to stderr, OR
**              Program writes the ASSERT to the log and continues, OR
**              Program asks Abort/Retry/Ignore? and takes that action.
**  Verify trap:
**      A VERIFY() failed. The VERIFY() macro works like ASSERT(),
**      but if MEMWATCH is not defined, it still evaluates the
**      expression, but it does not act upon the result.
**      Detect: On the VERIFY().
**      Action: Program ends with an advisory message to stderr, OR
**              Program writes the VERIFY to the log and continues, OR
**              Program asks Abort/Retry/Ignore? and takes that action.
**  Wild pointer:
**      A no-mans-land buffer has been written into. MEMWATCH can
**      allocate and distribute chunks of memory solely for the
**      purpose of trying to catch random writes into memory.
**      Detect: Always on CHECK(), but can be detected in several places.
**      Action: The error is logged, and if an ARI handler is installed,
**              it is executed, otherwise, execution continues.
**  Unfreed:
**      A memory buffer you allocated has not been freed.
**      You are informed where it was allocated, and whether any
**      over or underflow has occured. MemWatch also displays up to
**      16 bytes of the data, as much as it can, in hex and text.
**      Detect: When MemWatch terminates.
**      Action: The buffer is freed.
**  Check:
**      An error was detected during a CHECK() operation.
**      The associated pointer is displayed along with
**      the file and line where the CHECK() was executed.
**      Followed immediately by a normal error message.
**      Detect: When you CHECK()
**      Action: Depends on the error
**  Relink:
**      After a MEMWATCH internal control block has been trashed,
**      MEMWATCH tries to repair the damage. If successful, program
**      execution will continue instead of aborting. Some information
**      about the block may be gone permanently, though.
**      Detect: N/A
**      Action: Relink successful: program continues.
**              Relink fails: program aborts.
**  Internal:
**      An internal error is flagged by MEMWATCH when it's control
**      structures have been damaged. You are likely using an uninitialized
**      pointer somewhere in your program, or are zapping memory all over.
**      The message may give you additional diagnostic information.
**      If possible, MEMWATCH will recover and continue execution.
**      Detect: Various actions.
**      Action: Whatever is needed
**  Mark:
**      The program terminated without umarking all marked pointers. Marking
**      can be used to track resources other than memory. mwMark(pointer,text,...)
**      when the resource is allocated, and mwUnmark(pointer) when it's freed.
**      The 'text' is displayed for still marked pointers when the program
**      ends.
**      Detect: When MemWatch terminates.
**      Action: The error is logged.
**
**
************************************************************************
**
**  The author may be reached by e-mail at the address below. If you
**  mail me about source code changes in MEMWATCH, remember to include
**  MW's version number.
**
**      Johan Lindh
**      johan@linkdata.se
**
** The latest version of MEMWATCH may be downloaded from
** http://www.linkdata.se/
*/

#ifndef __MEMWATCH_H
#define __MEMWATCH_H

/* Make sure that malloc(), realloc(), calloc() and free() are declared. */
/*lint -save -e537 */
#include <stdlib.h>
/*lint -restore */

#ifdef __cplusplus
extern "C" {
#endif


/*
** Constants used
**  All MEMWATCH constants start with the prefix MW_, followed by
**  a short mnemonic which indicates where the constant is used,
**  followed by a descriptive text about it.
*/

#define MW_ARI_NULLREAD 0x10    /* Null read (to start debugger) */
#define MW_ARI_ABORT    0x04    /* ARI handler says: abort program! */
#define MW_ARI_RETRY    0x02    /* ARI handler says: retry action! */
#define MW_ARI_IGNORE   0x01    /* ARI handler says: ignore error! */

#define MW_VAL_NEW      0xFE    /* value in newly allocated memory */
#define MW_VAL_DEL      0xFD    /* value in newly deleted memory */
#define MW_VAL_NML      0xFC    /* value in no-mans-land */
#define MW_VAL_GRB      0xFB    /* value in grabbed memory */

#define MW_TEST_ALL     0xFFFF  /* perform all tests */
#define MW_TEST_CHAIN   0x0001  /* walk the heap chain */
#define MW_TEST_ALLOC   0x0002  /* test allocations & NML guards */
#define MW_TEST_NML     0x0004  /* test all-NML areas for modifications */

#define MW_NML_NONE     0       /* no NML */
#define MW_NML_FREE     1       /* turn FREE'd memory into NML */
#define MW_NML_ALL      2       /* all unused memory is NML */
#define MW_NML_DEFAULT  0       /* the default NML setting */

#define MW_STAT_GLOBAL  0       /* only global statistics collected */
#define MW_STAT_MODULE  1       /* collect statistics on a module basis */
#define MW_STAT_LINE    2       /* collect statistics on a line basis */
#define MW_STAT_DEFAULT 0       /* the default statistics setting */

/*
** MemWatch internal constants
**  You may change these and recompile MemWatch to change the limits
**  of some parameters. Respect the recommended minimums!
*/
#define MW_TRACE_BUFFER 2048    /* (min 160) size of TRACE()'s output buffer */
#define MW_FREE_LIST    64      /* (min 4) number of free()'s to track */

/*
** Exported variables
**  In case you have to remove the 'const' keyword because your compiler
**  doesn't support it, be aware that changing the values may cause
**  unpredictable behaviour.
**  - mwCounter contains the current action count. You can use this to
**      place breakpoints using a debugger, if you want.
*/
#ifndef __MEMWATCH_C
extern const unsigned long mwCounter;
#endif

/*
** System functions
**  Normally, it is not nessecary to call any of these. MEMWATCH will
**  automatically initialize itself on the first MEMWATCH function call,
**  and set up a call to mwAbort() using atexit(). Some C++ implementations
**  run the atexit() chain before the program has terminated, so you
**  may have to use mwInit() or the MemWatch C++ class to get good
**  behaviour.
**  - mwInit() can be called to disable the atexit() usage. If mwInit()
**      is called directly, you must call mwTerm() to end MemWatch, or
**      mwAbort().
**  - mwTerm() is usually not nessecary to call; but if called, it will
**      call mwAbort() if it finds that it is cancelling the 'topmost'
**      mwInit() call.
**  - mwAbort() cleans up after MEMWATCH, reports unfreed buffers, etc.
*/
void  mwInit( void );
void  mwTerm( void );
void  mwAbort( void );

/*
** Setup functions
**  These functions control the operation of MEMWATCH's protective features.
**  - mwFlushNow() causes MEMWATCH to flush it's buffers.
**  - mwDoFlush() controls whether MEMWATCH flushes the disk buffers after
**      writes. The default is smart flushing: MEMWATCH will not flush buffers
**      explicitly until memory errors are detected. Then, all writes are
**      flushed until program end or mwDoFlush(0) is called.
**  - mwLimit() sets the allocation limit, an arbitrary limit on how much
**      memory your program may allocate in bytes. Used to stress-test app.
**      Also, in virtual-memory or multitasking environs, puts a limit on
**      how much MW_NML_ALL can eat up.
**  - mwGrab() grabs up X kilobytes of memory. Allocates actual memory,
**      can be used to stress test app & OS both.
**  - mwDrop() drops X kilobytes of grabbed memory.
**  - mwNoMansLand() sets the behaviour of the NML logic. See the
**      MW_NML_xxx for more information. The default is MW_NML_DEFAULT.
**  - mwStatistics() sets the behaviour of the statistics collector. See
**      the MW_STAT_xxx defines for more information. Default MW_STAT_DEFAULT.
**  - mwFreeBufferInfo() enables or disables the tagging of free'd buffers
**      with freeing information. This information is written in text form,
**      using sprintf(), so it's pretty slow. Disabled by default.
**  - mwAutoCheck() performs a CHECK() operation whenever a MemWatch function
**      is used. Slows down performance, of course.
**  - mwCalcCheck() calculates checksums for all data buffers. Slow!
**  - mwDumpCheck() logs buffers where stored & calc'd checksums differ. Slow!!
**  - mwMark() sets a generic marker. Returns the pointer given.
**  - mwUnmark() removes a generic marker. If, at the end of execution, some
**      markers are still in existence, these will be reported as leakage.
**      returns the pointer given.
*/
void        mwFlushNow( void );
void        mwDoFlush( int onoff );
void        mwLimit( long bytes );
unsigned    mwGrab( unsigned kilobytes );
unsigned    mwDrop( unsigned kilobytes );
void        mwNoMansLand( int mw_nml_level );
void        mwStatistics( int level );
void        mwFreeBufferInfo( int onoff );
void        mwAutoCheck( int onoff );
void        mwCalcCheck( void );
void        mwDumpCheck( void );
void *      mwMark( void *p, const char *description, const char *file, unsigned line );
void *      mwUnmark( void *p, const char *file, unsigned line );

/*
** Testing/verification/tracing
**  All of these macros except VERIFY() evaluates to a null statement
**  if MEMWATCH is not defined during compilation.
**  - mwIsReadAddr() checks a memory area for read privilige.
**  - mwIsSafeAddr() checks a memory area for both read & write privilige.
**      This function and mwIsReadAddr() is highly system-specific and
**      may not be implemented. If this is the case, they will default
**      to returning nonzero for any non-NULL pointer.
**  - CHECK() does a complete memory integrity test. Slow!
**  - CHECK_THIS() checks only selected components.
**  - CHECK_BUFFER() checks the indicated buffer for errors.
**  - mwASSERT() or ASSERT() If the expression evaluates to nonzero, execution continues.
**      Otherwise, the ARI handler is called, if present. If not present,
**      the default ARI action is taken (set with mwSetAriAction()).
**      ASSERT() can be disabled by defining MW_NOASSERT.
**  - mwVERIFY() or VERIFY() works just like ASSERT(), but when compiling without
**      MEMWATCH the macro evaluates to the expression.
**      VERIFY() can be disabled by defining MW_NOVERIFY.
**  - mwTRACE() or TRACE() writes some text and data to the log. Use like printf().
**      TRACE() can be disabled by defining MW_NOTRACE.
*/
int   mwIsReadAddr( const void *p, unsigned len );
int   mwIsSafeAddr( void *p, unsigned len );
int   mwTest( const char *file, int line, int mw_test_flags );
int   mwTestBuffer( const char *file, int line, void *p );
int   mwAssert( int, const char*, const char*, int );
int   mwVerify( int, const char*, const char*, int );

/*
** User I/O functions
**  - mwTrace() works like printf(), but dumps output either to the
**      function specified with mwSetOutFunc(), or the log file.
**  - mwPuts() works like puts(), dumps output like mwTrace().
**  - mwSetOutFunc() allows you to give the adress of a function
**      where all user output will go. (exeption: see mwSetAriFunc)
**      Specifying NULL will direct output to the log file.
**  - mwSetAriFunc() gives MEMWATCH the adress of a function to call
**      when an 'Abort, Retry, Ignore' question is called for. The
**      actual error message is NOT printed when you've set this adress,
**      but instead it is passed as an argument. If you call with NULL
**      for an argument, the ARI handler is disabled again. When the
**      handler is disabled, MEMWATCH will automatically take the
**      action specified by mwSetAriAction().
**  - mwSetAriAction() sets the default ARI return value MEMWATCH should
**      use if no ARI handler is specified. Defaults to MW_ARI_ABORT.
**  - mwAriHandler() is an ANSI ARI handler you can use if you like. It
**      dumps output to stderr, and expects input from stdin.
**  - mwBreakOut() is called in certain cases when MEMWATCH feels it would
**      be nice to break into a debugger. If you feel like MEMWATCH, place
**      an execution breakpoint on this function.
*/
void  mwTrace( const char* format_string, ... );
void  mwPuts( const char* text );
void  mwSetOutFunc( void (*func)(int) );
void  mwSetAriFunc( int (*func)(const char*) );
void  mwSetAriAction( int mw_ari_value );
int   mwAriHandler( const char* cause );
void  mwBreakOut( const char* cause );

/*
** Allocation/deallocation functions
**  These functions are the ones actually to perform allocations
**  when running MEMWATCH, for both C and C++ calls.
**  - mwMalloc() debugging allocator
**  - mwMalloc_() always resolves to a clean call of malloc()
**  - mwRealloc() debugging re-allocator
**  - mwRealloc_() always resolves to a clean call of realloc()
**  - mwCalloc() debugging allocator, fills with zeros
**  - mwCalloc_() always resolves to a clean call of calloc()
**  - mwFree() debugging free. Can only free memory which has
**      been allocated by MEMWATCH.
**  - mwFree_() resolves to a) normal free() or b) debugging free.
**      Can free memory allocated by MEMWATCH and malloc() both.
**      Does not generate any runtime errors.
*/
void* mwMalloc( size_t, const char*, int );
void* mwMalloc_( size_t );
void* mwRealloc( void *, size_t, const char*, int );
void* mwRealloc_( void *, size_t );
void* mwCalloc( size_t, size_t, const char*, int );
void* mwCalloc_( size_t, size_t );
void  mwFree( void*, const char*, int );
void  mwFree_( void* );
char* mwStrdup( const char *, const char*, int );

/*
** Enable/disable precompiler block
**  This block of defines and if(n)defs make sure that references
**  to MEMWATCH is completely removed from the code if the MEMWATCH
**  manifest constant is not defined.
*/
#ifndef __MEMWATCH_C
#ifdef MEMWATCH

#define mwASSERT(exp)   while(mwAssert((int)(exp),#exp,__FILE__,__LINE__))
#ifndef MW_NOASSERT
#ifndef ASSERT
#define ASSERT          mwASSERT
#endif /* !ASSERT */
#endif /* !MW_NOASSERT */
#define mwVERIFY(exp)   while(mwVerify((int)(exp),#exp,__FILE__,__LINE__))
#ifndef MW_NOVERIFY
#ifndef VERIFY
#define VERIFY          mwVERIFY
#endif /* !VERIFY */
#endif /* !MW_NOVERIFY */
#define mwTRACE         mwTrace
#ifndef MW_NOTRACE
#ifndef TRACE
#define TRACE           mwTRACE
#endif /* !TRACE */
#endif /* !MW_NOTRACE */

/* some compilers use a define and not a function */
/* for strdup(). */
#ifdef strdup
#undef strdup
#endif

#define malloc(n)       mwMalloc(n,__FILE__,__LINE__)
#define strdup(p)       mwStrdup(p,__FILE__,__LINE__)
#define realloc(p,n)    mwRealloc(p,n,__FILE__,__LINE__)
#define calloc(n,m)     mwCalloc(n,m,__FILE__,__LINE__)
#define free(p)         mwFree(p,__FILE__,__LINE__)
#define CHECK()         mwTest(__FILE__,__LINE__,MW_TEST_ALL)
#define CHECK_THIS(n)   mwTest(__FILE__,__LINE__,n)
#define CHECK_BUFFER(b) mwTestBuffer(__FILE__,__LINE__,b)
#define MARK(p)         mwMark(p,#p,__FILE__,__LINE__)
#define UNMARK(p)       mwUnmark(p,__FILE__,__LINE__)

#else /* MEMWATCH */

#define mwASSERT(exp)
#ifndef MW_NOASSERT
#ifndef ASSERT
#define ASSERT          mwASSERT
#endif /* !ASSERT */
#endif /* !MW_NOASSERT */

#define mwVERIFY(exp)    exp
#ifndef MW_NOVERIFY
#ifndef VERIFY
#define VERIFY          mwVERIFY
#endif /* !VERIFY */
#endif /* !MW_NOVERIFY */

/*lint -esym(773,mwTRACE) */
#define mwTRACE         /*lint -save -e506 */ 1?(void)0:mwDummyTraceFunction /*lint -restore */
#ifndef MW_NOTRACE
#ifndef TRACE
/*lint -esym(773,TRACE) */
#define TRACE           mwTRACE
#endif /* !TRACE */
#endif /* !MW_NOTRACE */

extern void mwDummyTraceFunction(const char *,...);
/*lint -save -e652 */
#define mwDoFlush(n)
#define mwPuts(s)
#define mwInit()
#define mwGrab(n)
#define mwDrop(n)
#define mwLimit(n)
#define mwTest(f,l)
#define mwSetOutFunc(f)
#define mwSetAriFunc(f)
#define mwDefaultAri()
#define mwNomansland()
#define mwStatistics(f)
#define mwMark(p,t,f,n)     (p)
#define mwUnmark(p,f,n)     (p)
#define mwMalloc(n,f,l)     malloc(n)
#define mwStrdup(p,f,l)     strdup(p)
#define mwRealloc(p,n,f,l)  realloc(p,n)
#define mwCalloc(n,m,f,l)   calloc(n,m)
#define mwFree(p)           free(p)
#define mwMalloc_(n)        malloc(n)
#define mwRealloc_(p,n)     realloc(p,n)
#define mwCalloc_(n,m)      calloc(n,m)
#define mwFree_(p)          free(p)
#define mwAssert(e,es,f,l)
#define mwVerify(e,es,f,l)  (e)
#define mwTrace             mwDummyTrace
#define mwTestBuffer(f,l,b) (0)
#define CHECK()
#define CHECK_THIS(n)
#define CHECK_BUFFER(b)
#define MARK(p)             (p)
#define UNMARK(p)           (p)
/*lint -restore */

#endif /* MEMWATCH */
#endif /* !__MEMWATCH_C */

#ifdef __cplusplus
    }
#endif

#if 0 /* 980317: disabled C++ */

/*
** C++ support section
**  Implements the C++ support. Please note that in order to avoid
**  messing up library classes, C++ support is disabled by default.
**  You must NOT enable it until AFTER the inclusion of all header
**  files belonging to code that are not compiled with MEMWATCH, and
**  possibly for some that are! The reason for this is that a C++
**  class may implement it's own new() function, and the preprocessor
**  would substitute this crucial declaration for MEMWATCH new().
**  You can forcibly deny C++ support by defining MEMWATCH_NOCPP.
**  To enble C++ support, you must be compiling C++, MEMWATCH must
**  be defined, MEMWATCH_NOCPP must not be defined, and finally,
**  you must define 'new' to be 'mwNew', and 'delete' to be 'mwDelete'.
**  Unlike C, C++ code can begin executing *way* before main(), for
**  example if a global variable is created. For this reason, you can
**  declare a global variable of the class 'MemWatch'. If this is
**  is the first variable created, it will then check ALL C++ allocations
**  and deallocations. Unfortunately, this evaluation order is not
**  guaranteed by C++, though the compilers I've tried evaluates them
**  in the order encountered.
*/
#ifdef __cplusplus
#ifndef __MEMWATCH_C
#ifdef MEMWATCH
#ifndef MEMWATCH_NOCPP
extern int mwNCur;
extern const char *mwNFile;
extern int mwNLine;
class MemWatch {
public:
    MemWatch();
    ~MemWatch();
    };
void * operator new(size_t);
void * operator new(size_t,const char *,int);
void * operator new[] (size_t,const char *,int);	// hjc 07/16/02
void operator delete(void *);
#define mwNew new(__FILE__,__LINE__)
#define mwDelete (mwNCur=1,mwNFile=__FILE__,mwNLine=__LINE__),delete
#endif /* MEMWATCH_NOCPP */
#endif /* MEMWATCH */
#endif /* !__MEMWATCH_C */
#endif /* __cplusplus */

#endif /* 980317: disabled C++ */

#endif /* __MEMWATCH_H */

/* EOF MEMWATCH.H */
