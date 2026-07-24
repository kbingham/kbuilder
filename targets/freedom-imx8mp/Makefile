BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

dtb: linux-dtbs

all: dtb linux

tftp-freedom-imx8mp: $(BOOTSCRIPT) $(LINUX_IMAGE) $(LINUX_DTBS)

$(eval $(call fram,freedom-imx8mp,freedom-imx8mp@lab.linuxembedded.co.uk))
