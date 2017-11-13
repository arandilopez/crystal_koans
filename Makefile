CRYSTAL_BIN ?= $(shell which crystal)

all: test

test:
	$(CRYSTAL_BIN) spec --fail-fast
