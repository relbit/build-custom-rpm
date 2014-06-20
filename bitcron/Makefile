RPM_NAME         = bitcron
RPM_SUMMARY      = bitcron
RPM_LICENSE      = EULA
RPM_VERSION      = 2.0.5
RPM_RELEASE      = 200
RPM_SOURCE0      = $(RPM_NAME)-$(RPM_VERSION).tar.gz
RPM_URL          = gitolite@git.int.prg.relbit.com:bitcron.git
RPM_SOURCE_ISGIT = 1
RPM_GIT_BRANCH   = ruby2.1
RPM_SOURCES      = etc-cron.d-bitcron etc-logrotate.d-bitcron usr-sbin-bitcron-aggregate usr-sbin-bitcron-collect

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_stdrules
