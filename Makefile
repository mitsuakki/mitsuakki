# Source and output folders
SOURCE_DIR := src
BUILD_DIR  := build

# Source and output files
BINARY_NAME := portfolio
SRC := $(shell find $(SOURCE_DIR)/* -name "*.asm" -type f)

# Assembler data
ASM := nasm
ASMFLAGS := -f elf64

# Linker data
LD = ld

all: build
	./$(BUILD_DIR)/$(BINARY_NAME)

build:
	mkdir build
	$(ASM) $(ASMFLAGS) -g -F DWARF $(SRC) && mv src/*.o build/
	$(LD) -e _start -o $(BUILD_DIR)/$(BINARY_NAME) $(BUILD_DIR)/main.o

clean:
	rm -rf $(BUILD_DIR)

# Phony targets
.PHONY: clean