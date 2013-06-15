
/*
**  NOTE: Running this program in a Win32 or Unix environment
**  will probably result in a segmentation fault or protection
**  error. These errors may be caused by MEMWATCH when it is
**  looking at memory to see if it owns it, or may be caused by
**  the test program writing to memory it does not own.
**
**  MEMWATCH has two functions called 'mwIsReadAddr()' and
**  'mwIsSafeAddr()', which are system-specific.
**  If they are implemented for your system, and works
**  correctly, MEMWATCH will identify garbage pointers and
**  avoid causing segmentation faults, GP's etc.
**
**  If they are NOT implemented, count on getting the core
**  dumped when running this test program! As of this writing,
**  the safe-address checking has been implemented for Win32
**  and ANSI-C compliant systems. The ANSI-C checking traps
**  SIGSEGV and uses setjmp/longjmp to resume processing.
**
**  Note for Win95 users: The Win32 IsBadReadPtr() and its
**  similar functions can return incorrect values. This has
**  not happened under WinNT, though, just Win95.
**
**  991009 Johan Lindh
**
*/

#include <stdio.h>
#include <signal.h>
#include "memwatch.h"

#ifndef SIGSEGV
#error "SIGNAL.H does not define SIGSEGV; running this program WILL cause a core dump/crash!"
#endif

#ifndef MEMWATCH
#error "You really, really don't want to run this without memwatch. Trust me."
#endif

#if !defined(MW_STDIO) && !defined(MEMWATCH_STDIO)
#error "Define MW_STDIO and try again, please."
#endif

int main()
{
    char *p;

    /* Collect stats on a line number basis */
    mwStatistics( 2 );

    /* Slows things down, but OK for this test prg */
    /* mwAutoCheck( 1 ); */

    TRACE("Hello world!\n");

    p = malloc(210);
    free(p);
    p = malloc(20);
    p = malloc(200);    /* causes unfreed error */
    p[-1] = 0;          /* causes underflow error */
    free(p);

    p = malloc(100);
    p[ -(int)(sizeof(long)*8) ] = -1; /* try to damage MW's heap chain */
    free( p ); /* should cause relink */

    mwSetAriFunc( mwAriHandler );
    ASSERT(1==2);

    mwLimit(1000000);
    mwNoMansLand( MW_NML_ALL );

    /* These may cause a general protection fault (segmentation fault) */
    /* They're here to help test the no-mans-land protection */
    if( mwIsSafeAddr(p+50000,1) ) {
        TRACE("Killing byte at %p\n", p+50000);
        *(p+50000) = 0;
        }
    if( mwIsSafeAddr(p+30000,1) ) {
        TRACE("Killing byte at %p\n", p+30000);
        *(p+30000) = 0;
        }
    if( mwIsSafeAddr(p+1000,1) ) {
        TRACE("Killing byte at %p\n", p+1000);
        *(p+1000) = 0;
        }
    if( mwIsSafeAddr(p-100,1) ) {
        TRACE("Killing byte at %p\n", p-100);
        *(p-100) = 0;
        }

    /* This may cause a GP fault as well, since MW data buffers  */
    /* have been damaged in the above killing spree */
    CHECK();

    p = malloc(12000);
    p[-5] = 1;
    p[-10] = 2;
    p[-15] = 3;
    p[-20] = 4;

    /* This may cause a GP fault since MW's buffer list may have */
    /* been damaged by above killing, and it will try to repair it. */
    free(p);

	p = realloc(p,10);	/* causes realloc: free'd from error */

    /* May cause GP since MW will inspect the memory to see if it owns it. */
    free( (void*)main );
    
    return 0;
}

/* Comment out the following line to compile. */
#error "Hey! Don't just compile this program, read the comments first!"
