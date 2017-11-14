CRYSTAL_BIN ?= $(shell which crystal)
# GIT_BIN ?= $(shell which git)

all: test

test:
	$(CRYSTAL_BIN) spec --fail-fast

# install:
# 	$(GIT_BIN) checkout -b the-start-of-the-path
# 	$(GIT_BIN) commit -A "Let's begin"
