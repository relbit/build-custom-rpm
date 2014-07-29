RPM_NAME         = hhvm
RPM_SUMMARY      = HipHop VM (HHVM) is a virtual machine for executing programs written in PHP
RPM_LICENSE      = PHP(Zend)
RPM_VERSION      = 3.2
RPM_RELEASE      = 1
RPM_SOURCE0      = $(RPM_NAME)-$(RPM_VERSION).tar.gz
RPM_SOURCE_ISGIT = 1
RPM_URL          = https://github.com/facebook/$(RPM_NAME).git
RPM_GIT_BRANCH	 = HHVM-3.2
RPM_GIT_AFTERCMD = pushd hhvm $(SILENTOUT) && \
                   git submodule update --init --recursive && \
                   popd $(SILENTOUT)

RPM_SOURCES	 = hhvm.init hhvm.sysconfig

RPM_BUILD_DEP    = ImageMagick install; tbb install; libmemcached install; libglog install; boost install; sqlite install;

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_stdrules

download:
	$Vpushd hhvm/third-party/double-conversion $(SILENTOUT) && \
	curl -L http://double-conversion.googlecode.com/files/double-conversion-1.1.5.tar.gz \
		-o double-conversion.tar.gz && \
	popd $(SILENTOUT)
	$Vpushd hhvm/third-party/folly/src $(SILENTOUT) && \
	git checkout -f 18fd7eb11b312efc4c011e51fe4582cf597bc6a0 && \
	popd $(SILENTOUT)
	tar cf $(RPM_SOURCE0) $(RPM_NAME) $(SILENTOUT)
