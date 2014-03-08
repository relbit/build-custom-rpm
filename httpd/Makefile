RPM_NAME        = httpd
RPM_SUMMARY     = Apache HTTP Server
RPM_LICENSE     = Apache Software License
RPM_VERSION     = 2.4.7
RPM_RELEASE     = 1
RPM_SOURCE0     = $(RPM_NAME)-$(RPM_VERSION).tar.gz
RPM_URL         = http://tux.rainside.sk/apache//httpd/$(RPM_SOURCE0)

RPM_BUILD_DEP   = apr-util 

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_stdrules
