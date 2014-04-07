RPM_NAME        = bird
RPM_SUMMARY	= BIRD Internet Routing Daemon
RPM_LICENSE	= GPL
RPM_EPOCH	= 1
RPM_VERSION     = 1.4.0
RPM_RELEASE     = 1
RPM_SOURCE0     = $(RPM_NAME)-$(RPM_VERSION).tar.gz
RPM_URL		= ftp://bird.network.cz/pub/bird/$(RPM_SOURCE0)
RPM_SOURCES	= bird.init birdc6 birdcl6

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_stdrules
