##
## Welcome to $(BUILDSYS_ROOT)/build-common/Makefile
## Where all your build desires are made.
##

BUILDSYS_COMMON := $(BUILDSYS_ROOT)/build-common

include $(BUILDSYS_COMMON)/config.dirs

##
## BUILDSYS_TARGET_CONF should already be defined to locate Target Variables
##

BUILDSYS_TARGET_CONF ?= $(error This build system needs to be run from a configured directory)

## Define a target name from the build configuration
TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

## Catch all rules

all:



## Manage the target configuration file

BUILDSYS_TARGET_CONFIG_IN := $(BUILDSYS_TARGET_CONF)/config.in
$(BUILDSYS_TARGET_CONFIG_IN):
	$(error $(BUILDSYS_TARGET_CONFIG_IN) required to provide target details)

include $(BUILDSYS_TARGET_CONFIG_IN)


## Pull in any architecture specific defaults

include $(BUILDSYS_COMMON)/config.$(ARCH)

ifneq ($(SUBARCH),)
include $(BUILDSYS_COMMON)/config.$(SUBARCH)
endif


## Package support rules

PACKAGES:=$(BUILDSYS_COMMON)/packages
include $(BUILDSYS_COMMON)/support/*
include $(PACKAGES)/*

## Helpers

$(MKDIRS):
	@echo " [MKDIR] " $@
	@mkdir -p $@

# Our HOST path additions go on last so that they take precedence
# Put our Buildsystem installables on to the path
export PATH:=$(BUILDSYS_HOST)/usr/bin/:$(PATH)


## Parallel Build Support

J?=$(shell nproc)

## Provide useful information if asked
core-help:
	@echo "Buildsystem Configuration"
	@echo "ARCH : " $(ARCH)
	@echo "SUBARCH : " $(SUBARCH)
	@echo "BUILDSYS_TARGET_CONF: " $(BUILDSYS_TARGET_CONF)

help: core-help $(HELP)

