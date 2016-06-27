BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

all salvator: fdp1-test-install-target linux dtb tftp

linux: checkpatch

checkpatch:
	$(LINUX_SRC)/scripts/checkpatch.pl -f $(LINUX_SRC)/drivers/media/platform/rcar_fdp1.c
