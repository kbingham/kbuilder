BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

BOARD=board-salvator.nakedgeek.co.uk


# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

on salvator-on:
	salvator-on
	energenie-power 8camera on

off salvator-off:
	energenie-power 8camera off
	salvator-off

reboot salvator-reboot: salvator-off salvator-on

view-media-ctl:
	ssh root@$(BOARD) -o StrictHostKeyChecking=no \
		-tC media-ctl -d /dev/media0 \
			--print-dot 2>/dev/null | \
			grep -v bash | \
			tee /tmp/board-salvator-mc.dot | \
			dot -Tpng > /tmp/board-salvator-mc.png
	#cp /tmp/board-salvator-mc.* /media/janet/var/www/linuxembedded.co.uk/janet/
	eog /tmp/board-salvator-mc.png &

run: salvator-off all salvator-on

all salvator: linux dtb tftp

#fdp1-test-install-target linux dtb tftp


linux: # checkpatch

checkpatch:
	$(LINUX_SRC)/scripts/checkpatch.pl -f $(LINUX_SRC)/drivers/media/i2c/adv748x/*.[ch]

autoconf.h:
	ln -s $(LINUX_BUILD)/include/generated/autoconf.h


amazon-fire-on amazon-fire-off: EG_PORT:=1
amazon-fire-on: energenie-on
amazon-fire-off: energenie-off

sony-dvd-on sony-dvd-off: EG_PORT:=2
sony-dvd-on: energenie-on
sony-dvd-off: energenie-off

energenie-all-on energenie-all-off: EG_PORT:=all
energenie-all-on: energenie-on
energenie-all-off: energenie-off

.FORCE:

energenie-on: .FORCE
	ssh -XtC pi.nakedgeek.co.uk "sudo sispmctl -m ${EG_PORT}; sudo sispmctl -o ${EG_PORT}"

energenie-off: .FORCE
	ssh -XtC pi.nakedgeek.co.uk "sudo sispmctl -m ${EG_PORT}; sudo sispmctl -f ${EG_PORT}"

energenie-status: .FORCE
	ssh -XtC pi.nakedgeek.co.uk "sudo sispmctl -m all;"

all-off: energenie-all-off salvator-off

wait-for-ssh:
	ping $(BOARD) | grep --line-buffered "bytes from" | head -n 1
	ssh root@$(BOARD) echo

test-cvbs: wait-for-ssh
	ssh root@$(BOARD) -o ConnectTimeout=240 -XtC "cd vin-tests && ./yavta-cvbs"
	-rm *.png
	scp root@$(BOARD):/run/tmp/frame-*.png . && eog frame-*.png &

test-hdmi: wait-for-ssh
	ssh root@$(BOARD) -o ConnectTimeout=240 -XtC "cd vin-tests && ./yavta-hdmi"
	-rm *.png
	scp root@$(BOARD):/run/tmp/frame-*.png . && eog frame-*.png &

test: run test-hdmi
