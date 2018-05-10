BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile


TFTP_SERVER:=pi.nakedgeek.co.uk:/srv/tftp/

$(eval $(call power,energenie-power.banoffee,pandaboard))
$(eval $(call target-helpers,pandaboard))
