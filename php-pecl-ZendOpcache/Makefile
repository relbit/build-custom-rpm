RPM_PHP_NAME	= php53
RPM_EXT_NAME	= ZendOpcache
RPM_SUMMARY     = ZendOpcache extension
RPM_LICENSE     = PHP License
RPM_VERSION     = 7.0.3
RPM_RELEASE     = 2
RPM_URL		= http://pecl.php.net/
RPM_NAME        = $(RPM_PHP_NAME)-pecl-$(RPM_EXT_NAME)
RPM_SOURCE0     = zendopcache-$(RPM_VERSION).tgz
RPM_SOURCEN0	= zendopcache-$(RPM_VERSION)

RPM_SPECFILE	= php-pecl-$(RPM_EXT_NAME).spec.template
RPM_BUILD_DEP	= php install RPM_NAME=$(RPM_PHP_NAME)

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_peclrules
