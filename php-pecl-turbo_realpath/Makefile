RPM_PHP_NAME	= php53
RPM_PHP_VERSION = 5.3.29
RPM_EXT_NAME	= turbo_realpath
RPM_SUMMARY     = PHP Language PECL Extension - turbo_realpath
RPM_LICENSE     = Apache License 2.0
RPM_VERSION     = 1.3
RPM_RELEASE     = 4
RPM_URL		= http://eviaproject.org
RPM_NAME        = $(RPM_PHP_NAME)-pecl-$(RPM_EXT_NAME)
RPM_SOURCE0     = $(RPM_EXT_NAME)-$(RPM_VERSION).tgz
RPM_SOURCE_ISLOCAL = 1
RPM_PREFIX      = /opt/$(RPM_PHP_NAME)

RPM_SPECFILE	= php-pecl-$(RPM_EXT_NAME).spec.template
RPM_BUILD_DEP	= php install RPM_NAME=$(RPM_PHP_NAME) RPM_VERSION=$(RPM_PHP_VERSION)

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_peclrules
