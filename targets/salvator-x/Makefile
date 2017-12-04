BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

all salvator: linux dtb tftp

linux: checkpatch

checkpatch:
	# $(LINUX_SRC)/scripts/checkpatch.pl -f $(LINUX_SRC)/drivers/media/platform/rcar_fdp1.c
	#

off on reboot:
	energenie-power 8camera $@
	acme-power salvator-x $@

run: off all on

TFTP_SERVER:=pi.nakedgeek.co.uk:/srv/tftp/

$(eval $(call power,acme-power,salvator-x))
$(eval $(call power,acme-power,salvator-xs))
$(eval $(call power,energenie-power,8camera))
$(eval $(call power,energenie-power,eagle-v3m))

$(eval $(call target-helpers,salvator-x))
$(eval $(call target-helpers,salvator-xs))
$(eval $(call target-helpers,eagle-v3m))
