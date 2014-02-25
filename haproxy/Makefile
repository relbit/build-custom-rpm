RPM_DIR 	= rpms/
RPM_RELEASE 	= 1

HAPROXY_VERSION	= 1.5
HAPROXY_DEV = dev22

HAPROXY_FILE	= haproxy-$(HAPROXY_VERSION)-$(HAPROXY_DEV).tar.gz
HAPROXY_URL	= http://haproxy.1wt.eu/download/1.5/src/devel/$(HAPROXY_FILE)

# Makefile internals from here on:

files_to_copy 	= $(HAPROXY_FILE)

builddir	= ~/rpmbuild
rpmdir		= ~/rpmbuild/RPMS
sourcedir	= ~/rpmbuild/SOURCES
specdir		= ~/rpmbuild/SPECS

all: ship

help:
	@echo -e "HAProxy Build Suite for Evia 2"
	@echo -e "\texample usage:"
	@echo -e "\t\tmake HAPROXY_VERSION=1.5 HAPROXY_DEV=dev22"
	@echo -e "\tor just to build defaults:"
	@echo -e "\t\tmake"

download: 
	@[ ! -f $(HAPROXY_FILE) ] && \
		echo "Downloading $(HAPROXY_FILE)..." && \
		curl -sLO $(HAPROXY_URL) -o $(HAPROXY_FILE) || \
		[ -f $(HAPROXY_FILE) ]

spec:
	@echo "Make HAProxy $(HAPROXY_VERSION) spec file..."
	@sed -e "s/HAPROXY_VERSION/$(HAPROXY_VERSION)/g" \
	     -e "s/HAPROXY_DEV/$(HAPROXY_DEV)/g" \
	     -e "s/RPM_RELEASE/$(RPM_RELEASE)/g" \
	     haproxy.spec.template > haproxy-$(HAPROXY_VERSION)-$(HAPROXY_DEV).spec

build: spec prereq download
	@echo "Building HAProxy $(HAPROXY_VERSION) packages..."
	@[ ! -d $(sourcedir) ] && mkdir -p $(sourcedir) || [ -d $(sourcedir) ]
	@cp -f $(HAPROXY_FILE) $(sourcedir)/
	@rpmbuild -ba --quiet haproxy-$(HAPROXY_VERSION)-$(HAPROXY_DEV).spec 2> /dev/null

ship: build
	@echo -en "Shipping:\n`find $(rpmdir) | sort`\n"
	@mkdir -p $(RPM_DIR) || true
	@cp -rf `find $(rpmdir)` $(RPM_DIR)/
	
prereq:
	@echo "Make sure prerequisites installed..."
	@yum groupinstall -y -q development > /dev/null 2>&1
	@yum-builddep -y -q *.spec > /dev/null 2>&1 || true

clean:
	@echo "Cleaning up..."
	@rm -f $(HAPROXY_FILE)
	@rm -Rf *.spec
	@rm -Rf $(builddir)
	@rm -Rf rpms/
