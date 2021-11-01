PROJECT_DIR ?= $(PWD)
CLJ_DIR ?= $(CURDIR)
HEADERS ?= $(PROJECT_DIR)/include

BUILD ?= $(PWD)/build
CFLAGS += -I$(BUILD)
CFLAGS += -I$(CLJ_DIR)/src/c
CFLAGS += -I$(BUILD)
CFLAGS += -ggdb

$(BUILD)/%.txt: src/c/%.c
	mkdir -p $(BUILD)
	clang -D RUNTIME_GENERATION=1 $(CFLAGS) -c $< -o $(shell mktemp).o -Xclang -fdump-record-layouts | sed $$'s/\e\\[[0-9;:]*[a-zA-Z]//g' > $@

$(BUILD)/%.json: src/c/%.c
	mkdir -p $(BUILD)
	clang -D RUNTIME_GENERATION=1 $(CFLAGS) -o $(shell mktemp).o -c $< -Xclang -ast-dump=json > $@


hello:
	gcc -shared -o libs/libhello.so -fPIC src/c/hello.c
