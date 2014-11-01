RPM_NAME        = httpd22-mod_fastcgi
RPM_SUMMARY     = Apache module that enables FastCGI
RPM_LICENSE     = GPL, Apache License
RPM_VERSION     = 2.4.7
RPM_RELEASE     = 1
RPM_SOURCE0     = mod_fastcgi-$(RPM_VERSION).tar.gz
RPM_URL         = https://wcoserver.googlecode.com/files/$(RPM_SOURCE0)

RPM_SOURCES	= mod_fastcgi.te

RPM_BUILD_DEP	= httpd22 install;

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_stdrules
