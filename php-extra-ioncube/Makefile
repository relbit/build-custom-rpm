RPM_PHP_NAME	= php53
RPM_EXT_NAME	= ioncube
RPM_SUMMARY     = PHP Language PECL Extension - APC
RPM_LICENSE     = Proprietary
RPM_VERSION     = 4.5.3
RPM_RELEASE     = 2
RPM_URL		= http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
RPM_NAME        = $(RPM_PHP_NAME)-extra-$(RPM_EXT_NAME)
RPM_SOURCE0     = $(RPM_EXT_NAME)-$(RPM_VERSION).tgz

RPM_SPECFILE	= php-extra-$(RPM_EXT_NAME).spec.template
RPM_BUILD_DEP	= php install

# Makefile internals from here on:

ROOTDIR = $(shell pwd)/../
include $(ROOTDIR)Makefile.includes
include $(ROOTDIR)Makefile.pkg_peclrules

dependencies: download_default
