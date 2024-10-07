BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

dtb: $(DTB)

all: dtb linux

$(eval $(call fram,pollux,pollux@lab.linuxembedded.co.uk))

tftp-pollux: $(LINUX_IMAGES) $(LINUX_DTBS)
