RPM_NAME        = virtual-php56
RPM_SUMMARY     = PHP Language Virtual Package
RPM_LICENSE     = PHP
RPM_VERSION     = 1
RPM_RELEASE     = 1
RPM_SOURCE0     = none
RPM_URL         = none

RPM_SPECFILE	= none

RPM_PHP_NAME = php56
RPM_PHP_VERSION = 5.6.0
RPM_PHP_RELEASE = 2
RPM_BUILD_DEP   = php install		RPM_NAME=$(RPM_PHP_NAME)     RPM_VERSION=$(RPM_PHP_VERSION)     RPM_RELEASE=$(RPM_PHP_RELEASE); \
		php-pecl-geoip		RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); \
		php-pecl-igbinary	RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); \
		php-pecl-memcache	RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); \
		php-pecl-mongo		RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); \
		php-pecl-redis		RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); \
		php-pecl-turbo_realpath	RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION); \
		php-pecl-APCu		RPM_PHP_NAME=$(RPM_PHP_NAME) RPM_PHP_VERSION=$(RPM_PHP_VERSION)

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_virtualrules
