RPM_NAME        = virtual-php
RPM_SUMMARY     = PHP Language Virtual Package
RPM_LICENSE     = PHP
RPM_VERSION     = 1
RPM_RELEASE     = 1
RPM_SOURCE0     = none
RPM_URL         = none

RPM_SPECFILE	= none
# Original build line for default versions
#RPM_BUILD_DEP   = php install; php-pecl-APCu; php-pecl-geoip; php-pecl-igbinary; php-pecl-memcache; php-pecl-mongo; php-pecl-redis; php-pecl-turbo_realpath; php-pecl-ZendOpcache; php-extra-ioncube

# Experimental PHP 5.6
RPM_DEP_WEAK	= 1
RPM_BUILD_DEP   = php install RPM_NAME=php56 RPM_VERSION=5.6.0beta3 RPM_URL=http://downloads.php.net/tyrael/php-5.6.0beta3.tar.gz; php-pecl-geoip RPM_PHP_NAME=php56; php-pecl-igbinary RPM_PHP_NAME=php56; php-pecl-memcache RPM_PHP_NAME=php56; php-pecl-mongo RPM_PHP_NAME=php56; php-pecl-redis RPM_PHP_NAME=php56; php-pecl-turbo_realpath RPM_PHP_NAME=php56; php-extra-ioncube RPM_PHP_NAME=php56


# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_virtualrules
