RPM_NAME        = httpd22-apr
RPM_SUMMARY     = Apache Portable Runtime library
RPM_LICENSE     = ASL 2.0
RPM_VERSION     = 1.3.12
RPM_RELEASE     = 1
RPM_SOURCE0     = apr-$(RPM_VERSION).tar.bz2
RPM_URL         = https://archive.apache.org/dist/apr/$(RPM_SOURCE0)

RPM_SOURCES	= apr-0.9.7-deepbind.patch apr-1.2.7-fnmatch.patch \
		  apr-1.3.9-r1309394.patch apr-1.2.2-libdir.patch \
		  apr-1.2.7-pkgconf.patch apr-rhel7-fixbuild.patch \
		  apr-1.2.2-locktimeout.patch apr-1.3.9-CVE-2011-0419.patch \
		  apr-wrapper.h


# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_stdrules
