RPM_PHP_NAME	= php53
RPM_EXT_NAME	= mongo
RPM_SUMMARY     = PHP Language PECL Extension for MongoDB
RPM_LICENSE     = PHP
RPM_VERSION     = 1.4.5
RPM_RELEASE     = 2
RPM_URL		= http://pecl.php.net/
RPM_NAME        = $(RPM_PHP_NAME)-pecl-$(RPM_EXT_NAME)
RPM_SOURCE0     = $(RPM_EXT_NAME)-$(RPM_VERSION).tgz

RPM_SPECFILE	= php-pecl-$(RPM_EXT_NAME).spec.template
RPM_BUILD_DEP	= php install

# Makefile internals from here on:

ROOTDIR = $(shell pwd)/../
include $(ROOTDIR)Makefile.includes
include $(ROOTDIR)Makefile.pkg_peclrules
