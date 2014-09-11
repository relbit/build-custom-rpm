RPM_PHP_NAME	= php53
RPM_PHP_VERSION = 5.3.29
RPM_EXT_NAME	= igbinary
RPM_SUMMARY     = igbinary extension
RPM_LICENSE     = New BSD
RPM_VERSION     = 1.1.1
RPM_RELEASE     = 3
RPM_URL		= http://pecl.php.net/
RPM_NAME        = $(RPM_PHP_NAME)-pecl-$(RPM_EXT_NAME)
RPM_SOURCE0     = $(RPM_EXT_NAME)-$(RPM_VERSION).tgz
RPM_PREFIX      = /opt/$(RPM_PHP_NAME)

RPM_SPECFILE	= php-pecl-$(RPM_EXT_NAME).spec.template
RPM_BUILD_DEP	= php install RPM_NAME=$(RPM_PHP_NAME) RPM_VERSION=$(RPM_PHP_VERSION)

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_peclrules
