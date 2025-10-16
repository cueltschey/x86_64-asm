# x86\_64 GNU/Linux Assembler

This is a program I wrote to assemble most linux programs for x86\_64 architecture. It takes in assembly in AT&T syntax from the GCC compiler (this is what I tested with but it might work with others).

## Building

The following dependencies are needed to build the project:
- GCC
- flex
- make

To build run make:
```bash
make
```

## Testing

The program can be tested in several ways.

1. Running `make self` will assemble the assemblers own source files and link them into a working executable
2. Running `make test` will assemble all .s files in the samples folder and verify the results
3. Running `./assemble_and_run.sh` will compile and run a simple application using the assembler

## Assembling Projects

To use this program to compile other projects simply stop before the assemble step:
```bash
cat << EOF > main.c
#include "stdio.h"
int main(){printf("Hello World\n");}
EOF
gcc main.c -S -o a.s
```
Then use the compiled program and a linker:
```bash
./x86_64-asm a.s -o a.o -v
ld a.o -o test_exec
./test_exec
```

## Using the multi-threaded version

On the branch `parallel` there is a version of the assembler that uses multiple threads to assemble files all at once. This is done by splitting the assembly into phases of processing, .rodata, function inserts and ELF writing. This results in an ~50% increase of speed with large batches of files as compared to standard GCC.
