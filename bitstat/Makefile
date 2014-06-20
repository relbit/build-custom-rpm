RPM_NAME         = bitstat
RPM_SUMMARY      = bitstat
RPM_LICENSE      = Apache Software License
RPM_VERSION      = 2.0.5
RPM_RELEASE      = 200
RPM_SOURCE0      = $(RPM_NAME)-$(RPM_VERSION).tar.gz
RPM_URL          = gitolite@git.int.prg.relbit.com:bitstat.git
RPM_SOURCE_ISGIT = 1
RPM_GIT_BRANCH   = ruby2.1
RPM_SOURCES      = etc-init.d-bitstat etc-logrotate.d-bitstat usr-sbin-bitstat

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_stdrules
