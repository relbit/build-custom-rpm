RPM_PHP_NAME	= php53
RPM_EXT_NAME	= turbo_realpath
RPM_SUMMARY     = PHP Language PECL Extension - turbo_realpath
RPM_LICENSE     = Apache License 2.0
RPM_VERSION     = 1.3
RPM_RELEASE     = 2
RPM_URL		= http://eviaproject.org
RPM_NAME        = $(RPM_PHP_NAME)-pecl-$(RPM_EXT_NAME)
RPM_SOURCE0     = $(RPM_EXT_NAME)-$(RPM_VERSION).tgz
RPM_SOURCE_ISLOCAL = 1

RPM_SPECFILE	= php-pecl-$(RPM_EXT_NAME).spec.template
RPM_BUILD_DEP	= php install

# Makefile internals from here on:

ROOTDIR = $(shell pwd)/../
include $(ROOTDIR)Makefile.includes
include $(ROOTDIR)Makefile.pkg_peclrules
