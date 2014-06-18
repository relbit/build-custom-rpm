RPM_NAME        = php53
RPM_SUMMARY     = PHP Language
RPM_LICENSE     = PHP
RPM_VERSION     = 5.3.28
RPM_RELEASE     = 5
RPM_SOURCE0     = php-$(RPM_VERSION).tar.bz2
RPM_URL         = http://cz1.php.net/get/$(RPM_SOURCE0)/from/this/mirror

RPM_SPECFILE	= php.spec.template
RPM_SOURCES	= etc-init.d-php-fpm etc-php.ini etc-php-fpm.conf

ifeq ($(RPM_VERSION),5.3.28)
RPM_SOURCES	+= 0001-CVE-2014-0185.patch \
		   0001-CVE-2014-0237.patch \
		   0001-CVE-2014-0238.patch \
		   0001-CVE-2014-2497.patch
endif

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_stdrules
