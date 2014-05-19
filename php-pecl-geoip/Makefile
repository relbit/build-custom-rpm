RPM_PHP_NAME	= php53
RPM_EXT_NAME	= geoip
RPM_SUMMARY     = Map IP address to geographic places
RPM_LICENSE     = PHP
RPM_VERSION     = 1.0.8
RPM_RELEASE     = 1
RPM_URL		= http://pecl.php.net/
RPM_NAME        = $(RPM_PHP_NAME)-pecl-$(RPM_EXT_NAME)
RPM_SOURCE0     = $(RPM_EXT_NAME)-$(RPM_VERSION).tgz

RPM_SPECFILE	= php-pecl-$(RPM_EXT_NAME).spec.template
RPM_BUILD_DEP	= php install RPM_NAME=$(RPM_PHP_NAME)

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_peclrules
