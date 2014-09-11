RPM_NAME        = virtual-php
RPM_SUMMARY     = PHP Language Virtual Package
RPM_LICENSE     = PHP
RPM_VERSION     = 1
RPM_RELEASE     = 1
RPM_SOURCE0     = none
RPM_URL         = none

RPM_SPECFILE	= none
# Original build line for default versions
#RPM_BUILD_DEP   = php install; php-pecl-APCu; php-pecl-geoip; php-pecl-igbinary; php-pecl-memcache; php-pecl-mongo; php-pecl-redis; php-pecl-turbo_realpath; php-extra-ioncube; php-pecl-APC

# Experimental PHP 5.6
#RPM_DEP_WEAK	= 1
RPM_PHP_NAME = php56
RPM_PHP_VERSION = 5.6.0
RPM_BUILD_DEP   = php install RPM_NAME=$(RPM_PHP_NAME) RPM_VERSION=$(RPM_PHP_VERSION); php-pecl-geoip RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-igbinary RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-memcache RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-mongo RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-redis RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-turbo_realpath RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-APCu RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION)

# PHP 5.5
#RPM_PHP_VERSION = 5.5.16
#RPM_PHP_NAME = php55
#RPM_BUILD_DEP   = php install RPM_NAME=$(RPM_PHP_NAME) RPM_VERSION=$(RPM_PHP_VERSION); php-pecl-geoip RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-igbinary RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-memcache RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-mongo RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-redis RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-turbo_realpath RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-extra-ioncube RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-APCu RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION)

# PHP 5.4
#RPM_PHP_VERSION = 5.4.32
#RPM_PHP_NAME = php54
#RPM_BUILD_DEP   = php install RPM_NAME=$(RPM_PHP_NAME) RPM_VERSION=$(RPM_PHP_VERSION); php-pecl-geoip RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-igbinary RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-memcache RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-mongo RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-redis RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-turbo_realpath RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-extra-ioncube RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-APCu RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); php-pecl-ZendOpcache RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION)



# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_virtualrules
