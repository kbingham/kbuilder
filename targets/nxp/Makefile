BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

dtb: linux-dtbs

all: dtb linux

$(eval $(call fram,debix-model-a,debix@lab.linuxembedded.co.uk))
$(eval $(call fram,debix-som,debix-som@lab.linuxembedded.co.uk))
$(eval $(call fram,freedom-imx8mp,freedom-imx8mp@lab.linuxembedded.co.uk))
$(eval $(call fram,pollux,pollux@lab.linuxembedded.co.uk))
$(eval $(call fram,caster,castor@lab.linuxembedded.co.uk))
$(eval $(call fram,blubbel,blubbel@lab.linuxembedded.co.uk))
$(eval $(call fram,clubbel,clubbel@lab.linuxembedded.co.uk))
