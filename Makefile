############################################################
# General purpose makefile
#
# Works for all simple C-projects where
# - binaries are compiled into sub-dir bin
# - binaries are created from a single c-source of the same name
# - we specify the curses library depending on the platform
#
# Note: multiple targets (binaries) in ./bin are supported
#

# Please add targets in ./bin here
TARGETS += $(BIN_DIR)/worm
 
#################################################
# There is no need to edit below this line
#################################################

MACHINE := $(shell uname -m)
$(info $$MACHINE is $(MACHINE))
ifeq ($(MACHINE), i686)
  CFLAGS = -g -Wall
  LDLIBS = -lncurses
else ifeq ($(MACHINE), armv7l)
  CFLAGS = -g -Wall
  LDLIBS = -lncurses
else ifeq ($(MACHINE), arm64)
  CFLAGS = -g -Wall
  LDLIBS = -lncurses
else ifeq ($(MACHINE), x86_64)
  CFLAGS = -g -Wall
  LDLIBS = -lncurses
endif

#### Fixed variable definitions
CC = gcc
RM_DIR = rm -rf
MKDIR = mkdir
SHELL = /bin/bash
BIN_DIR = bin

#### Default target
all: $(BIN_DIR) $(TARGETS)

#### Fixed build rule for a monolithic C-File (only one source file per binary)
$(BIN_DIR)/% : %.c
	$(CC) $(CFLAGS) $< -o $@ $(LDLIBS)

$(BIN_DIR):
	$(MKDIR) $(BIN_DIR)

.PHONY: clean
clean :
	$(RM_DIR) $(BIN_DIR)

