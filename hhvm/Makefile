RPM_NAME         = hhvm
RPM_SUMMARY      = HipHop VM (HHVM) is a virtual machine for executing programs written in PHP
RPM_LICENSE      = PHP(Zend)
RPM_VERSION      = 3.1dev
RPM_RELEASE      = 1
RPM_SOURCE0      = $(RPM_NAME)-$(RPM_VERSION).tar.gz
RPM_SOURCE_ISGIT = 1
RPM_URL          = https://github.com/facebook/$(RPM_NAME).git
RPM_GIT_BRANCH	 = master
RPM_GIT_AFTERCMD = pushd hhvm $(SILENTOUT) && \
                   git submodule update --init --recursive && \
                   popd $(SILENTOUT)

RPM_BUILD_DEP    = ImageMagick install; tbb install; libmemcached install; libglog install; libicu install; boost install;

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_stdrules

