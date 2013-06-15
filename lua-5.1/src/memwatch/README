README for MEMWATCH 2.69

 This file should be enough to get you started, and should be
 enough for small projects. For more info, see the files USING
 and the FAQ. If this is not enough, see memwatch.h, which is
 well documented.

 Memwatch is licensed under the GPL from version 2.69
 onwards. Please read the file gpl.txt for more details.

 If you choose to use memwatch to validate your projects, I
 would like to hear about it. Please drop me a line at
 johan@linkdata.se about the project itself, the hardware,
 operating system, compiler and any URL(s) you feel is
 appropriate.

***** To run the test program:

 Look at the source code for test.c first. It does some really
 nasty things, and I want you to be aware of that. If memwatch
 can't capture SIGSEGV (General Protection Fault for Windoze),
 your program will dump core (crash for Windoze).

 Once you've done that, you can build the test program.

 Linux and other *nixes with gcc:

  gcc -o test -DMEMWATCH -DMEMWATCH_STDIO test.c memwatch.c

 Windows 95, Windows NT with MS Visual C++:

  cl -DMEMWATCH -DMEMWATCH_STDIO test.c memwatch.c

 Then simply run the test program.

  ./test


***** Quick-start instructions:

 1. Make sure that memwatch.h is included in all of the
 source code files. If you have an include file that
 all of the source code uses, you might be able to include
 memwatch.h from there.

 2. Recompile the program with MEMWATCH defined. See your
 compiler's documentation if you don't know how to do this.
 The usual switch looks like "-DMEMWATCH". To have MEMWATCH
 use stderr for some output (like, "Abort, Retry, Ignore?"),
 please also define MW_STDIO (or MEMWATCH_STDIO, same thing).

 3. Run the program and examine the output in the
 log file "memwatch.log". If you didn't get a log file,
 you probably didn't do step 1 and 2 correctly, or your
 program crashed before memwatch flushed the file buffer.
 To have memwatch _always_ flush the buffer, add a call
 to "mwDoFlush(1)" at the top of your main function.

 4. There is no fourth step... but remember that there
 are limits to what memwatch can do, and that you need
 to be aware of them:

***** Limits to memwatch:

 Memwatch cannot catch all wild pointer writes. It can catch
 those it could make itself due to your program trashing
 memwatch's internal data structures. It can catch, sort of,
 wild writes into No Mans Land buffers (see the header file for
 more info). Anything else and you're going to get core dumped,
 or data corruption if you're lucky.

 There are other limits of course, but that one is the most
 serious one, and the one that you're likely to be suffering
 from.

***** Can use memwatch with XXXXX?

 Probably the answer is yes. It's been tested with several
 different platforms and compilers. It may not work on yours
 though... but there's only one way to find out.

***** Need more assistance?

 I don't want e-mail on "how to program in C", or "I've got a
 bug, help me". I _do_ want you to send email to me if you
 find a bug in memwatch, or if it won't compile cleanly on your
 system (assuming it's an ANSI-C compiler of course).
 
 If you need help with using memwatch, read the header file.
 If, after reading the header file, you still can't resolve the
 problem, please mail me with the details.

 I can be reached at "johan@linkdata.se".
 
 The latest version of memwatch should be found at
 "http://www.linkdata.se/".

 Johan Lindh

