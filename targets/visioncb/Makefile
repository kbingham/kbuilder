BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

dtb: linux-dtbs

all: dtb linux

tftp-visioncb8m: $(BOOTSCRIPT)

boot-notes:
	@echo "	setenv ethaddr ce:1f:45:14:74:5c; dhcp && source"


visioncb8m-on: boot-notes

$(eval $(call fram,visioncb8m,visioncb8m@lab.linuxembedded.co.uk))
