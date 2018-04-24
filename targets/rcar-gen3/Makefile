BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

dtb: linux-dtbs

all: dtb linux

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

TFTP_SERVER:=pi.nakedgeek.co.uk:/srv/tftp/

$(eval $(call power,acme-power,salvator-x))
$(eval $(call power,acme-power,salvator-xs))
$(eval $(call power,energenie-power,8camera))
$(eval $(call power,energenie-power,eagle-v3m))

$(eval $(call target-helpers,salvator-x))
$(eval $(call target-helpers,salvator-xs))
$(eval $(call target-helpers,eagle-v3m))

$(eval $(call power,energenie-power.banoffee,salvator-xs-m3n))
$(eval $(call target-helpers,salvator-xs-m3n))

$(eval $(call magnus-farm,9013-draak,9013,r8a77995-draak.dtb))
