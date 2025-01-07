BINARY_NAME:=portfolio
ASMFILES:= main.asm # $(shell find src/* -name "*.asm" -type f)

all: test build
	./$(BINARY_NAME)

.PHONY: build
build:
	nasm -f elf64 -g -F DWARF $(ASMFILES)
	ld -e start -o $(BINARY_NAME) src/main.o

.PHONY: test
test:
	echo "Ouais tqt"

.PHONY: clean
clean:
	rm -rf $(BINARY_NAME) src/main.o