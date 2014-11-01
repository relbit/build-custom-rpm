RPM_NAME        = httpd22
RPM_SUMMARY     = Apache HTTP Server
RPM_LICENSE     = ASL 2.0
RPM_VERSION     = 2.2.29
RPM_RELEASE     = 1
RPM_SOURCE0     = httpd-$(RPM_VERSION).tar.gz
RPM_URL         = https://archive.apache.org/dist/httpd/$(RPM_SOURCE0)

RPM_SOURCES	= htcacheclean.init htcacheclean.sysconf \
		  httpd-2.0.45-export.patch httpd-2.0.52-logresline.patch \
		  httpd-2.1.10-apctl.patch httpd-2.1.10-apxs.patch \
		  httpd-2.1.10-disablemods.patch httpd-2.1.10-layout.patch \
		  httpd-2.1.10-pod.patch httpd-2.2.0-authnoprov.patch \
		  httpd-2.2.11-corelimit.patch httpd-2.2.11-selinux.patch \
		  httpd-2.2.11-xfsz.patch httpd-2.2.14-ldapdyngrp.patch \
		  httpd-2.2.14-release.patch httpd-2.2.15-aboverflow.patch \
		  httpd-2.2.15-ab-ssl.patch httpd-2.2.15-ajperror.patch \
		  httpd-2.2.15-ajptimeout-worker.patch httpd-2.2.15-cachehardmax.patch \
		  httpd-2.2.15-davputfail.patch httpd-2.2.15-expectnoka.patch \
		  httpd-2.2.15-filterhdr.patch httpd-2.2.15-ldap-auth-attrs.patch \
		  httpd-2.2.15-ldapcache.patch httpd-2.2.15-ldap-unavailable.patch \
		  httpd-2.2.15-logconfig-cookie.patch httpd-2.2.15-modreqto2217.patch \
		  httpd-2.2.15-oomabort.patch httpd-2.2.15-partial-cache.patch \
		  httpd-2.2.15-pr45444.patch httpd-2.2.15-pr49328.patch \
		  httpd-2.2.15-proxy-ajp.patch httpd-2.2.15-proxyblock.patch \
		  httpd-2.2.15-proxyconn.patch httpd-2.2.15-proxyepsv.patch \
		  httpd-2.2.15-proxy-failonstatus.patch \
		  httpd-2.2.15-proxy-spurious-warn.patch \
		  httpd-2.2.15-rotatelogs-condition.patch \
		  httpd-2.2.15-sslbadcdev.patch httpd-2.2.15-ssldupkeys.patch \
		  httpd-2.2.15-sslfips.patch httpd-2.2.15-sslmultiproxy.patch \
		  httpd-2.2.15-ssloidval.patch httpd-2.2.15-sslproxyio.patch \
		  httpd-2.2.15-ssl-proxy-pkey.patch httpd-2.2.15-sslpxycerts.patch \
		  httpd-2.2.15-sslsninotreq.patch httpd-2.2.3-CVE-2012-2687.patch \
		  httpd-2.2.3-defpidlog.patch httpd-2.2.3-extfiltereos.patch \
		  httpd-2.2.3-graceful-ebadf.patch httpd-2.2.3-ldaprefer.patch \
		  httpd-2.2.3-mod_proxy-change-state.patch httpd-2.2.3-noxpad.patch \
		  httpd-2.2.3-pngmagic.patch httpd-2.2.3-pr41743.patch \
		  httpd-2.2.3-r1068313.patch httpd-2.2.3-r1201331.patch \
		  httpd-2.2.3-r693108.patch httpd-2.2.3-r965824.patch \
		  httpd-2.2.3-r982629.patch httpd-2.2.3-rotatelogs-trunk.patch \
		  httpd-2.2.3-ssluserid.patch httpd-2.2.9-deplibs.patch \
		  httpd.conf httpd.ini httpd.init httpd.logrotate \
		  httpd-sl_index.html.sl.patch httpd-spec_sl_index.html.sl.patch \
		  httpd.sysconf index.html manual.conf README.confd ssl.conf \
		  welcome.conf

RPM_BUILD_DEP	= httpd22-apr-util install;

# Makefile internals from here on:

MAKEDIR = $(shell pwd)/../.make/
include $(MAKEDIR)Makefile.includes
include $(MAKEDIR)Makefile.pkg_stdrules
