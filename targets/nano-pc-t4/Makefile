BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

dtb: linux-dtbs

all: linux-nanopi4-images


flash:
	sudo bin/upgrade_tool di resource $(LINUX_BUILD)/resource.img
	sudo bin/upgrade_tool di kernel $(LINUX_BUILD)/kernel.img
	sudo bin/upgrade_tool RD
