RPM_NAME        = nginx
RPM_SUMMARY     = High performance web server
RPM_LICENSE     = 2-clause BSD-like license
RPM_VERSION     = 1.6.2
RPM_RELEASE     = 1
RPM_SOURCE0     = $(RPM_NAME)-$(RPM_VERSION).tar.gz
RPM_URL         = http://nginx.org/download/$(RPM_SOURCE0)
RPM_SOURCES	= logrotate nginx.init nginx.sysconf nginx.conf nginx.vh.default.conf nginx.vh.example_ssl.conf nginx.service nginx.upgrade.sh


# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_stdrules
