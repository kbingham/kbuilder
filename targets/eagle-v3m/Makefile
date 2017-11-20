BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

all: dtb linux

run: off all tftp on

linux: checkpatch

on off reboot:
	energenie-power v3m $@

checkpatch:
	# Run any checkpatch if desired
	#$(LINUX_SRC)/scripts/checkpatch.pl -f $(LINUX_SRC)/drivers/media/platform/rcar_fdp1.c

bisect_pre:
	cp kernel.config.defconfig kernel.config
	yes "" | $(MAKE) linux-oldconfig

bisect: bisect_pre run linux-save-defconfig
	git add kernel.config.defconfig
	git commit -m "Updated kernel.config.defconfig"
	git show -p
