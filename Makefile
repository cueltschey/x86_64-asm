CC = gcc
LEX = flex
CFLAGS = -Wall -Wextra -g -Werror -std=c99
TARGET = x86_64-asm
OBJS = main.o elf.o asm.o args.o text.o lex.yy.o log.o

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

log.o: log.c log.h
	$(CC) $(CFLAGS) -c log.c

lex.yy.o: lex.yy.c
	$(CC) -c lex.yy.c

lex.yy.c: lex.l lex.h
	$(LEX) lex.l



clean:
	rm -f $(TARGET) $(OBJS) *.o core *.out lex.yy.c test_exec

test: $(TARGET)
	@for file in $(wildcard samples/*.s); do \
		echo "Running ./assemble_and_run.sh on $$file"; \
		./assemble_and_run.sh $(TARGET) "$$file"; \
		if [ $$? -ne 0 ]; then \
			break; \
		fi; \
	done

self: $(TARGET)
	@for file in $(wildcard self_assemble/*.s); do \
		echo "$(TARGET) $$file -o ${$$file%s}o -v"; \
		./$(TARGET) "$$file" -o "${$$file%s}o" -v; \
		if [ $$? -ne 0 ]; then \
			break; \
		fi; \
	done

.PHONY: all clean test_asm
