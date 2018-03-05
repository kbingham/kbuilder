BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

all: linux-dtbs linux

$(eval $(call magnus-farm,9207-wheat,9207,r8a7792-wheat.dtb,earlycon keep_boot_con))
