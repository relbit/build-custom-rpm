RPM_NAME         = bitctl
RPM_SUMMARY      = bitctl
RPM_LICENSE      = Apache Software License
RPM_VERSION      = 2.1.1
RPM_RELEASE      = 1
RPM_SOURCE0      = $(RPM_NAME)-$(RPM_VERSION).tar.gz
RPM_URL          = gitolite@git.int.prg.relbit.com:bitctl.git
RPM_SOURCE_ISGIT = 1
RPM_GIT_BRANCH   = ruby2.1
RPM_SOURCES      = etc-init.d-bitctl etc-logrotate.d-bitctl usr-sbin-bitctl

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_stdrules

#rpmbuild_root = /tmp/kvik
