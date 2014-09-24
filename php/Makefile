RPM_NAME        = php53
RPM_SUMMARY     = PHP Language
RPM_LICENSE     = PHP
RPM_VERSION     = 5.3.29
RPM_RELEASE     = 11
RPM_SOURCE0     = php-$(RPM_VERSION).tar.bz2
RPM_URL         = http://cz1.php.net/get/$(RPM_SOURCE0)/from/this/mirror
RPM_PREFIX      = /opt/$(RPM_NAME)

RPM_SPECFILE	= php.spec.template
RPM_SOURCES	= etc-init.d-php-fpm etc-php.ini

ifeq ($(RPM_NAME),php53)
RPM_SOURCES	+= php53-dtrace.patch
endif

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_stdrules
