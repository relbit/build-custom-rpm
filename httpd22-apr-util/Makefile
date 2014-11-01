RPM_NAME        = httpd22-apr-util
RPM_SUMMARY     = Apache Portable Runtime Utility library
RPM_LICENSE     = ASL 2.0
RPM_VERSION     = 1.3.12
RPM_RELEASE     = 1
RPM_SOURCE0     = apr-util-$(RPM_VERSION).tar.bz2
RPM_URL         = https://archive.apache.org/dist/apr/$(RPM_SOURCE0)

RPM_SOURCES	= apr-util-1.2.7-pkgconf.patch apr-util-1.3.7-nodbmdso.patch

RPM_BUILD_DEP	= httpd22-apr install;

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_stdrules
