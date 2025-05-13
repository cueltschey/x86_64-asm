## CSE 6163 Graduate Project: Parallelized x86_64 Assembler

Find my code on github here: [https://github.com/cueltschey/x86_64-asm](https://github.com/cueltschey/x86_64-asm) 

Note: the parallel implementation is on the branch parallel. To run and test my code for yourself run the followingggggggggg:
```bash
make
make test # tests with a large number of testing assembly files
make self # assembles the assembler from source
```

### Problem Analysis

**Problem Overview:** When implementing an x86_64 assembler, I found that it has 6 main steps to assemble any given file. Those steps are:

1. Parse CLI arguments and initialize state
2. Open input files
3. Tokenize input for processing
4. Parse file for function definitions, .rodata strings, and relocations
5. Encode instructions line by line for each function
6. Write ELF sections and symbols to object file

These steps are difficult to parallelize and are extremely difficult to manage. First lets delve into what the critical path is.

**Critical Path:** The longest critical path is between tokenization and instruction encoding. Each individual file can be handled entirely by a separate process, which allows for easy file level parallelism. But for steps 3 and 4, all parsing must be done sequentially. This is because the actual instruction encoding relies on complete global definitions of strings relocations and functions. Without these definitions the instructions will not be correct. Additionally step 4 requires step 3 to be completed, since it requires full access to the entire tokenized source file. As a result, a large portion of the assembly process must be done sequentially. Around 25% of an assembly file is global definitions, and the tokenization takes considerable time as well.

Another sequential section to be aware of is the ELF writing. All of the information must be available to write the ELF data, meaning all threads must synchronize at step 6.

**Approach to Parallelization:** Aside from the parallelization at the file level, I decided to chunk the assembly by function, assembling each one individually. First the assembly is chunked, and global data is allocated, then the function chunks are processed by separate threads. Finally, the computed machine code is merged and conflicts are resolved. This approach maximizes speedup, by parallelizing the processing of around 75% of instructions, as well as maintaining the integrity of required global data.

**Theoretical Maximum Speedup:** The theoretical maximum speedup for this problem can be found using Amdalh's law. I will assume that 75% of all instructions are local to a function, and can be processed in a thread.

```c
max_speedup = 1 / ((1-0.75) + (0.75 / program_speedup))
```

This works out to an absolute maximum speedup of around 4 (1/0.25) times.

**Directed Acyclic Graph:** The following is a DAG representing my implementation of the problem. Note that some details are left out for simplicity, such as the omission of mentioning global data dependencies.

[DAG](./dag.drawio.png) 


### Sequential Results

**T1**: The sequential version of the assembler took around 0.01 seconds to assemble a single, moderately sized assembly file. For testing I used the source of the assembler. The assembler was tasked with encoding instructions for its own source code. With the sequential implementation, the assembler took 0.11527 seconds to assemble all required sources (around 11 large files).

**Comparison with GNU as:** The most used assembler on linux is the GNU as program. When using GNU as, the same compilation took  0.154134543 seconds. That is around 36% less efficient than my implementation.

### Parallel Results

**Tp:** My implementation with file parallelism and function chunking took  0.056316000 seconds to complete. This is around a 2 times speedup in comparison with the sequential version.

**Explanation:** I think the speedup was less that 4 times due to the overhead of opening, tokenizing, and writing ELF data. Additionally, there was a large amount of latency resulting from copying data to and from each thread, since a large amount of instruction data needed to be stored and transferred before it could be written.


### Conclusion

Assemblers are not computationally intensive programs. They are generally not designed with performance in mind, in part due to the small size of assembly files, and the large critical path. Implementing parallel processing was time intensive, and resulted in many difficult bugs arising. If I were to develop a professional assembler, I would focus on robustness over speed. Nonetheless, the results were effective. Overall the best speedup I was able to achieve was a result of good coding practice, such as effective memory use, good data structures, effective processing, and switch statements. In this case, performance was best improved by refactoring rather than parallelizing.
