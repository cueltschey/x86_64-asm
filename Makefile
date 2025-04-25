CC = gcc
LEX = flex
CFLAGS = -Wall -Wextra -g -Werror -std=c99
TARGET = x86_64-asm
OBJS = main.o elf.o asm.o args.o text.o lex.yy.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(TARGET)

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

elf.o: elf.c elf.h
	$(CC) $(CFLAGS) -c elf.c

asm.o: asm.c asm.h
	$(CC) $(CFLAGS) -c asm.c

args.o: args.c args.h
	$(CC) $(CFLAGS) -c args.c

text.o: text.c text.h
	$(CC) $(CFLAGS) -c text.c

lex.yy.o: lex.yy.c
	$(CC) -c lex.yy.c

lex.yy.c: lex.l lex.h
	$(LEX) lex.l



clean:
	rm -f $(TARGET) $(OBJS) *.o core *.out lex.yy.c test_exec

test:
	@echo "Testing test_asm/hello.s"
	./test_asm.sh $(TARGET) test_asm/hello.s
	@echo "Testing test_asm/if.s"
	./test_asm.sh $(TARGET) test_asm/if.s

.PHONY: all clean test_asm
