RPM_NAME        = php53
RPM_SUMMARY     = PHP Language
RPM_LICENSE     = PHP
RPM_VERSION     = 5.3.28
RPM_RELEASE     = 2
RPM_SOURCE0     = php-$(RPM_VERSION).tar.bz2
RPM_URL         = http://cz1.php.net/get/$(RPM_SOURCE0)/from/this/mirror

RPM_SPECFILE	= php.spec.template
RPM_SOURCES	= etc-init.d-php-fpm etc-php.ini etc-php-fpm.conf

# Makefile internals from here on:

ROOTDIR = $(shell pwd)/../
include $(ROOTDIR)Makefile.includes
include $(ROOTDIR)Makefile.pkg_stdrules
