

## Headers
__Usage__
Declare self-defined function from multiple source, to avoid defining them repeatedly in calling program

__Example__
in a ___func.h___ (header file)

~~~c
#ifndef FUNC_H_
#define FUNC_H_
#endif
void helloworld(char * name); // declaration of function
~~~
in a ___func.c___ (source file)
~~~c
#include <stdio.h>
#include "func.h" // relative directory of head file

void helloworld(char * name) // defination of function
{
printf("hello world from : %s\n",name);
}
~~~
in a ___main.c___ (calling program)
~~~c
#include "func.h"
int main(){
helloworld; // calling function defined in head file 
return 0;
}
~~~
in a shell
~~~bash
$ gcc -Wall main.c helloworld.c -o main
~~~

## Library
__Lib types__
* Shared library (.so format) : loaded before calling program executed
* Static library (.a format) : copied to program executable

__Default search path__
for ___gcc___ headers : `/usr/local/include` and `/usr/include`
for ___gcc___ libraries : `/usr/local/lib` and `/usr/lib`

__Show linker's search path__
for ___ld___ : `$ ld --verbose | grep SEARCH_DIR`
for __gcc__: `$ gcc -print-search-dirs`

__appending search path list__

* Usually the path for shared objects are in `LD_LIBRARY_PATH`, which is used by `ld` to search `.so`
* But during compilation period, set shared objects path in `LIBRARY_PATH` for `GCC` to search during compiling

~~~bash
$ export LIBRARY_PATH=$LIBRARY_PATH:/new/path/to/lib
~~~

__Example__
### Using a Archive library
1. compile source into archive file(__libhelloworld.a__)
~~~bash
$ gcc -c helloworld.c 				 # compile source to object file
$ ar cr libhellowrold.a helloworld.c # archive source to libhelloworld.a
~~~
2. link to __libhelloworld.a__ during compiling __main.c__
~~~bash
$ gcc -Wall main.c libhelloworld.a -o main
~~~
also helpful to inspect which files are archived:
~~~bash
$ ar t libhelloworld.a # list shared libraries inside archive(.os)
$ ar x libhelloworld.a # extracr shared libraries from archive(.os)
$ ar r libhelloworld.a newlib.o # add newlib.o into existing archive
$ ar d libhelloworld.a addition.o # delete unsused archive member 
~~~
__Orders__
Link libraries that calls following libraries as correct order:

~~~bash
$ gcc -Wall main.c libhelloworld.a libc.a -o main # libhelloworld.a should use libraryC.a
~~~
1. search first command line options: `-I` or `-L`
2. search secondly specified directories of linker or compiler:` C_INCLUDE_PATH`, `CPLUS_INCLUDE_PATH`,` LIBRARY_PATH`
3. Last search in default system path: `/usr/local/include`, `/usr/include` or `/usr/local/lib`, `/usr/lib`
### Using a Shared library (lighter than archive libraries)
when`$LIBRARY_PATH` was set for `GCC` to search for libraries: 
~~~bash
$ gcc -Wall -I/path/to/headers -L/path/to/libraries main.c -lhelloworld
# header path and library path include corresponding files of helloworld library
~~~

when `$LD_LIBRARY_PATH` was set for `ld` to link up libraries
~~~bash
$ gcc -Wall -c main.c # produce object of main.c (main.o)
$ gcc -Wall -o main.o -lhelloworld
~~~
