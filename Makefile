CC = gcc
CFLAGS = -Wall -Wextra -g -Werror -std=c99
TARGET = x86_64-asm
OBJS = main.o elf.o asm.o args.o text.o

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

clean:
	rm -f $(TARGET) $(OBJS) *.o core *.out output.o test.o

test_asm: $(TARGET) test_asm/hello.s
	@echo "Testing with test_asm/hello.s"
	./$(TARGET) test_asm/hello.s -o hello.o
	@echo "--- readelf -a hello.o ---"
	@readelf -a hello.o
	@echo "--- objdump -d hello.o ---"
	@objdump -d hello.o
	@echo "--- Linking hello.o ---"
	ld hello.o -o hello_exec
	@echo "--- Running ./test_exec ; echo \$$? ---"
	./hello_exec
	@echo $$?
	@echo "-------------------------"

.PHONY: all clean test_asm
