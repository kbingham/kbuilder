BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

dtb: linux-dtbs

all: dtb linux

TFTP_SERVER:=pi.nakedgeek.co.uk:/srv/tftp/

$(eval $(call power,energenie-power.banoffee,beagle-v))
$(eval $(call target-helpers,beagle-v))
