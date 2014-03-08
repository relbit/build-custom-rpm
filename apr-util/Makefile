RPM_NAME        = apr-util
RPM_SUMMARY     = Apache Portable Runtime library utilities
RPM_LICENSE     = Apache Software License
RPM_VERSION     = 1.5.3
RPM_RELEASE     = 1
RPM_SOURCE0     = $(RPM_NAME)-$(RPM_VERSION).tar.gz
RPM_URL         = http://tux.rainside.sk/apache//apr/$(RPM_SOURCE0)

RPM_BUILD_DEP	= apr install_default

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_stdrules
