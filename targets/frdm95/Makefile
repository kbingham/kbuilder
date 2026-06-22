BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

dtb: linux-dtbs

all: dtb linux

tftp-frdm95: $(BOOTSCRIPT) $(LINUX_IMAGE)

$(eval $(call fram,frdm95,frdm95@lab.linuxembedded.co.uk))
