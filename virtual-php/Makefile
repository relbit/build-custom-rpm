RPM_NAME        = virtual-php
RPM_SUMMARY     = PHP Language Virtual Package
RPM_LICENSE     = PHP
RPM_VERSION     = 1
RPM_RELEASE     = 1
RPM_SOURCE0     = none
RPM_URL         = none

RPM_SPECFILE	= none
RPM_BUILD_DEP   = php install; php-pecl-APC; php-pecl-geoip; php-pecl-igbinary; php-pecl-memcache; php-pecl-mongo; php-pecl-redis; php-pecl-turbo_realpath; php-extra-ioncube

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_virtualrules
