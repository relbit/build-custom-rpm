RPM_NAME        = _skel
RPM_SUMMARY     = Exaple package using HAProxy versioning scheme \
		  to demonstrate. Don\'t forget to properly escape \
		  \/\'s or \'s and use \\\\ if you\'re not done yet
RPM_LICENSE     = GPLv2
RPM_VERSION     = 1.0.22
# If the package version differs from what you want if to be, set the original here:
RPM_VERSIO2     = 1.0-dev22
RPM_RELEASE     = 1

# Source package name
#  - If unpacked folder name differs from package name, use RPM_SOURCEN0 to specify it
RPM_SOURCEN0    = $(RPM_NAME)-$(RPM_VERSIO2)
RPM_SOURCE0     = $(RPM_SOURCEN0).tar.gz
#  - If it's the usual case:
# RPM_SOURCE0     = $(RPM_NAME)-$(RPM_VERSION).tar.gz

# Where to download the source package:
RPM_URL         = http://somelocation/$(RPM_SOURCE0)

# Extra files to copy to $(srcdir/) - ie. init scripts, etc.
RPM_SOURCES	=

# Specify other packages from this repository
# RPM_BUILD_DEP	= packagename target_to_make flags
# - More complicated example, like httpd has it:
RPM_BUILD_DEP	= apr install_default RPM_RELEASE=$(RPM_RELEASE) \
			VERBOSE=$(VERBOSE); \
		  apr-util install_default RPM_RELEASE=$(RPM_RELEASE) \
			VERBOSE=$(VERBOSE);
# *** Makefile internals from here on:

ROOTDIR = $(shell pwd)/../
include $(ROOTDIR)Makefile.includes
include $(ROOTDIR)Makefile.pkg_stdrules
