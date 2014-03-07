RPM_PHP_NAME	= php53
RPM_EXT_NAME	= suhosin
RPM_SUMMARY     = PHP Language PECL Extension for MongoDB
RPM_LICENSE     = PHP
RPM_VERSION     = 0.9.35
RPM_RELEASE     = 2
RPM_NAME        = $(RPM_PHP_NAME)-pecl-$(RPM_EXT_NAME)
RPM_SOURCE0     = $(RPM_EXT_NAME)-$(RPM_VERSION).tgz
RPM_URL		= http://download.suhosin.org/$(RPM_SOURCE0)

RPM_SPECFILE	= php-pecl-$(RPM_EXT_NAME).spec.template
RPM_BUILD_DEP	= php install

# Makefile internals from here on:

ROOTDIR = $(shell pwd)/../
include $(ROOTDIR)Makefile.includes
include $(ROOTDIR)Makefile.pkg_peclrules

dependencies: download_default
