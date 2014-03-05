RPM_DIR 	= rpms/
RPM_RELEASE 	= 1

HTTPD_VERSION		= 2.4.7
HTTPD_FILE		= httpd-$(HTTPD_VERSION).tar.gz
HTTPD_URL		= http://tux.rainside.sk/apache//httpd/$(HTTPD_FILE)
APR_VERSION		= 1.5.0
APR_FILE		= apr-$(APR_VERSION).tar.gz
APR_URL			= http://tux.rainside.sk/apache//apr/$(APR_FILE)
APR_UTIL_VERSION	= 1.5.3
APR_UTIL_FILE		= apr-util-$(APR_UTIL_VERSION).tar.gz
APR_UTIL_URL		= http://tux.rainside.sk/apache//apr/$(APR_UTIL_FILE)


# Makefile internals from here on:

files_to_copy 	= $(HTTPD_FILE)

builddir	= ~/rpmbuild
rpmdir		= ~/rpmbuild/RPMS
sourcedir	= ~/rpmbuild/SOURCES
specdir		= ~/rpmbuild/SPECS

all: ship

help:
	@echo -e "Apache HTTP Server Build Suite for Evia 2"
	@echo -e "\texample usage:"
	@echo -e "\t\tmake HTTPD_VERSION=2.4.7"
	@echo -e "\tor just to build defaults:"
	@echo -e "\t\tmake"

download_httpd: 
	@[ ! -f $(HTTPD_FILE) ] && \
		echo "Downloading $(HTTPD_FILE)..." && \
		curl -sLO $(HTTPD_URL) -o $(HTTPD_FILE) || \
		[ -f $(HTTPD_FILE) ]
download_apr: 
	@[ ! -f $(APR_FILE) ] && \
		echo "Downloading $(APR_FILE)..." && \
		curl -sLO $(APR_URL) -o $(APR_FILE) || \
		[ -f $(APR_FILE) ]
download_apr_util: 
	@[ ! -f $(APR_UTIL_FILE) ] && \
		echo "Downloading $(APR_UTIL_FILE)..." && \
		curl -sLO $(APR_UTIL_URL) -o $(APR_UTIL_FILE) || \
		[ -f $(APR_UTIL_FILE) ]

download: download_*

spec_httpd:
	@echo "Make Apache HTTP Server $(HTTPD_VERSION) spec file..."
	@sed -e "s/HTTPD_VERSION/$(HTTPD_VERSION)/g" \
	     -e "s/HTTPD_FILE/$(HTTPD_FILE)/g" \
	     -e "s/RPM_RELEASE/$(RPM_RELEASE)/g" \
	     httpd.spec.template > httpd-$(HTTPD_VERSION).spec

spec_apr:
	@echo "Make Apache Portable Runtime $(APR_VERSION) spec file..."
	@sed -e "s/APR_VERSION/$(APR_VERSION)/g" \
	     -e "s/APR_FILE/$(APR_FILE)/g" \
	     -e "s/RPM_RELEASE/$(RPM_RELEASE)/g" \
	     apr.spec.template > apr-$(APR_VERSION).spec

spec_apr_util:
	@echo "Make Apache Portable Runtime $(APR_UTIL_VERSION) spec file..."
	@sed -e "s/APR_UTIL_VERSION/$(APR_UTIL_VERSION)/g" \
	     -e "s/APR_UTIL_FILE/$(APR_UTIL_FILE)/g" \
	     -e "s/RPM_RELEASE/$(RPM_RELEASE)/g" \
	     apr-util.spec.template > apr-util-$(APR_UTIL_VERSION).spec

build_apr: download_apr spec_apr prereq
	@echo "Building Apache Portable Runtime $(APR_VERSION) packages..."
	@yum-builddep -y -q *.spec > /dev/null 2>&1 || true
	@[ ! -d $(sourcedir) ] && mkdir -p $(sourcedir) || [ -d $(sourcedir) ]
	@for file in $(APR_FILE); do \
		cp -f $$file $(sourcedir)/; \
	done
	@[ -f $(rpmdir)/x86_64/apr-$(APR_VERSION)-$(RPM_RELEASE).el6.x86_64.rpm ] || \
		rpmbuild -ba --quiet apr-$(APR_VERSION).spec 2> /dev/null

install_apr: build_apr
	@echo "Installing Apache Portable Runtime $(APR_VERSION)..." && \
	yum localinstall -y -q \
		$(rpmdir)/x86_64/apr-$(APR_VERSION)-$(RPM_RELEASE).el6.x86_64.rpm \
		$(rpmdir)/x86_64/apr-devel-$(APR_VERSION)-$(RPM_RELEASE).el6.x86_64.rpm || \
	[ "`rpm -qa | grep apr-devel-$(APR_VERSION)`" != ""]

build_apr_util: download_apr_util spec_apr_util install_apr
	@echo "Building Apache Portable Runtime Util $(APR_UTIL_VERSION) packages..."
	@yum-builddep -y -q *.spec > /dev/null 2>&1 || true
	@[ ! -d $(sourcedir) ] && mkdir -p $(sourcedir) || [ -d $(sourcedir) ]
	@for file in $(APR_UTIL_FILE); do \
		cp -f $$file $(sourcedir)/; \
	done
	@[ -f $(rpmdir)/x86_64/apr-util-$(APR_UTIL_VERSION)-$(RPM_RELEASE).el6.x86_64.rpm ] || \
		rpmbuild -ba --quiet apr-util-$(APR_UTIL_VERSION).spec 2> /dev/null

install_apr_util: build_apr_util
	@echo "Installing Apache Portable Runtime Util $(APR_UTIL_VERSION)..." && \
	yum localinstall -y -q \
		$(rpmdir)/x86_64/apr-util-$(APR_UTIL_VERSION)-$(RPM_RELEASE).el6.x86_64.rpm \
		$(rpmdir)/x86_64/apr-util-devel-$(APR_UTIL_VERSION)-$(RPM_RELEASE).el6.x86_64.rpm || \
	[ "`rpm -qa | grep apr-util-devel-$(APR_UTIL_VERSION)`" != ""]

build_httpd: download_httpd spec_httpd install_apr install_apr_util
	@echo "Building Apache HTTP Server $(HTTPD_VERSION) packages..."
	@yum-builddep -y -q *.spec > /dev/null 2>&1 || true
	@[ ! -d $(sourcedir) ] && mkdir -p $(sourcedir) || [ -d $(sourcedir) ]
	@for file in $(HTTPD_FILE); do \
		cp -f $$file $(sourcedir)/; \
	done
	@[ -f $(rpmdir)/x86_64/httpd-$(HTTPD_VERSION)-$(RPM_RELEASE).el6.x86_64.rpm ] || \
		rpmbuild -ba --quiet httpd-$(HTTPD_VERSION).spec 2> /dev/null

build: build_httpd

ship: build
	@echo -en "Shipping:\n`find $(rpmdir) | sort`\n"
	@mkdir -p $(RPM_DIR) || true
	@cp -r $(rpmdir)/* $(RPM_DIR)/
	
prereq:
	@echo "Make sure prerequisites installed..."
	@yum groupinstall -y -q development > /dev/null 2>&1

clean:
	@echo "Cleaning up..."
	@rm -f $(HTTPD_FILE) $(APR_FILE) $(APR_UTIL_FILE)
	@rm -Rf *.spec
	@rm -Rf $(builddir)
	@rm -Rf rpms/
