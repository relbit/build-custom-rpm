RPM_DIR 	= rpms/
RPM_RELEASE 	= 1

LIBMEMCACHED_VERSION	= 1.0.18

LIBMEMCACHED_FILE	= libmemcached-$(LIBMEMCACHED_VERSION).tar.gz
LIBMEMCACHED_URL	= https://launchpad.net/libmemcached/1.0/1.0.18/+download/$(LIBMEMCACHED_FILE)


# Makefile internals from here on:

files_to_copy 	= $(LIBMEMCACHED_FILE)

builddir	= ~/rpmbuild
rpmdir		= ~/rpmbuild/RPMS
sourcedir	= ~/rpmbuild/SOURCES
specdir		= ~/rpmbuild/SPECS

all: ship

help:
	@echo -e "libmemcached Build Suite for Evia 2"
	@echo -e "\texample usage:"
	@echo -e "\t\tmake LIBMEMCACHED_VERSION=3.0.4"
	@echo -e "\tor just to build defaults:"
	@echo -e "\t\tmake"

download: 
	@[ ! -f $(LIBMEMCACHED_FILE) ] && \
		echo "Downloading $(LIBMEMCACHED_FILE)..." && \
		curl -sLO $(LIBMEMCACHED_URL) -o $(LIBMEMCACHED_FILE) || \
		[ -f $(LIBMEMCACHED_FILE) ]

spec:
	@echo "Make libmemcached $(LIBMEMCACHED_VERSION) spec file..."
	@sed -e "s/LIBMEMCACHED_VERSION/$(LIBMEMCACHED_VERSION)/g" \
	     -e "s/LIBMEMCACHED_FILE/$(LIBMEMCACHED_FILE)/g" \
	     -e "s/RPM_RELEASE/$(RPM_RELEASE)/g" \
	     libmemcached.spec.template > libmemcached-$(LIBMEMCACHED_VERSION).spec

build: spec prereq download
	@echo "Building libmemcached $(LIBMEMCACHED_VERSION) packages..."
	@[ ! -d $(sourcedir) ] && mkdir -p $(sourcedir) || [ -d $(sourcedir) ]
	@for file in $(files_to_copy); do \
		cp -f $$file $(sourcedir)/; \
	done
	@[ -f $(RPM_DIR)/x86_64/libmemcached-$(LIBMEMCACHED_VERSION)-$(RPM_RELEASE).el6.x86_64.rpm ] || \
		rpmbuild -ba libmemcached-$(LIBMEMCACHED_VERSION).spec

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
	@rm -f $(LIBMEMCACHED_FILE)
	@rm -Rf *.spec
	@rm -Rf $(builddir)
	@rm -Rf rpms/
