RPM_PHP_NAME	= php53
RPM_EXT_NAME	= memcache
RPM_SUMMARY     = PHP Language PECL Extension - Memcache
RPM_LICENSE     = PHP
RPM_VERSION     = 3.0.8
RPM_RELEASE     = 2
RPM_URL		= http://pecl.php.net/
RPM_NAME        = $(RPM_PHP_NAME)-pecl-$(RPM_EXT_NAME)
RPM_SOURCE0     = $(RPM_EXT_NAME)-$(RPM_VERSION).tgz

RPM_SPECFILE	= php-pecl-$(RPM_EXT_NAME).spec.template
RPM_BUILD_DEP	= php install

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_peclrules
