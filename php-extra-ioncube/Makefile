RPM_PHP_NAME     = php53
RPM_PHP_VERSION  = 5.3.29
RPM_EXT_NAME     = ioncube
RPM_SUMMARY      = ionCube Loader
RPM_LICENSE      = Proprietary
RPM_VERSION      = 4.6.1
RPM_RELEASE      = 4
RPM_URL          = http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
RPM_NAME         = $(RPM_PHP_NAME)-extra-$(RPM_EXT_NAME)
RPM_SOURCE0      = $(RPM_EXT_NAME)-$(RPM_VERSION).tgz
RPM_PREFIX       = /opt/$(RPM_PHP_NAME)

RPM_SPECFILE     = php-extra-$(RPM_EXT_NAME).spec.template
RPM_BUILD_DEP    = php install RPM_NAME=$(RPM_PHP_NAME) RPM_VERSION=$(RPM_PHP_VERSION)

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_peclrules

dependencies: download_default
