RPM_DIR 	= rpms/
RPM_RELEASE 	= 1

HTTPD_VERSION	= 2.4.7

HTTPD_FILE	= httpd-$(HTTPD_VERSION).tar.gz
HTTPD_URL	= http://tux.rainside.sk/apache//httpd/$(HTTPD_FILE)


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

download: 
	@[ ! -f $(HTTPD_FILE) ] && \
		echo "Downloading $(HTTPD_FILE)..." && \
		curl -sLO $(HTTPD_URL) -o $(HTTPD_FILE) || \
		[ -f $(HTTPD_FILE) ]

spec:
	@echo "Make Apache HTTP Server $(HTTPD_VERSION) spec file..."
	@sed -e "s/HTTPD_VERSION/$(HTTPD_VERSION)/g" \
	     -e "s/HTTPD_FILE/$(HTTPD_FILE)/g" \
	     -e "s/RPM_RELEASE/$(RPM_RELEASE)/g" \
	     httpd.spec.template > httpd-$(HTTPD_VERSION).spec

build: spec prereq download
	@echo "Building Apache HTTP Server $(HTTPD_VERSION) packages..."
	@[ ! -d $(sourcedir) ] && mkdir -p $(sourcedir) || [ -d $(sourcedir) ]
	@for file in $(files_to_copy); do \
		cp -f $$file $(sourcedir)/; \
	done
	@[ -f $(RPM_DIR)/x86_64/httpd-$(HTTPD_VERSION)-$(RPM_RELEASE).el6.x86_64.rpm ] || \
		rpmbuild -ba --quiet httpd-$(HTTPD_VERSION).spec 2> /dev/null

ship: build
	@echo -en "Shipping:\n`find $(rpmdir) | sort`\n"
	@mkdir -p $(RPM_DIR) || true
	@cp -r $(rpmdir)/* $(RPM_DIR)/
	
prereq:
	@echo "Make sure prerequisites installed..."
	@yum groupinstall -y -q development > /dev/null 2>&1
	@yum-builddep -y -q *.spec > /dev/null 2>&1 || true

clean:
	@echo "Cleaning up..."
	@rm -f $(HTTPD_FILE)
	@rm -Rf *.spec
	@rm -Rf $(builddir)
	@rm -Rf rpms/
