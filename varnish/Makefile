RPM_DIR 	= rpms/
RPM_RELEASE 	= 1

VARNISH_VERSION	= 3.0.4

VARNISH_FILE	= varnish-$(VARNISH_VERSION).tar.gz
VARNISH_URL	= http://repo.varnish-cache.org/source/$(VARNISH_FILE)


# Makefile internals from here on:

files_to_copy 	= $(VARNISH_FILE)

builddir	= ~/rpmbuild
rpmdir		= ~/rpmbuild/RPMS
sourcedir	= ~/rpmbuild/SOURCES
specdir		= ~/rpmbuild/SPECS

all: ship

help:
	@echo -e "Varnish Build Suite for Evia 2"
	@echo -e "\texample usage:"
	@echo -e "\t\tmake VARNISH_VERSION=3.0.4"
	@echo -e "\tor just to build defaults:"
	@echo -e "\t\tmake"

download: 
	@[ ! -f $(VARNISH_FILE) ] && \
		echo "Downloading $(VARNISH_FILE)..." && \
		curl -sLO $(VARNISH_URL) -o $(VARNISH_FILE) || \
		[ -f $(VARNISH_FILE) ]

spec:
	@echo "Make Varnish $(VARNISH_VERSION) spec file..."
	@sed -e "s/VARNISH_VERSION/$(VARNISH_VERSION)/g" \
	     -e "s/VARNISH_FILE/$(VARNISH_FILE)/g" \
	     -e "s/RPM_RELEASE/$(RPM_RELEASE)/g" \
	     varnish.spec.template > varnish-$(VARNISH_VERSION).spec

build: spec prereq download
	@echo "Building Varnish $(VARNISH_VERSION) packages..."
	@[ ! -d $(sourcedir) ] && mkdir -p $(sourcedir) || [ -d $(sourcedir) ]
	@for file in $(files_to_copy); do \
		cp -f $$file $(sourcedir)/; \
	done
	@[ -f $(RPM_DIR)/x86_64/varnish-$(VARNISH_VERSION)-$(RPM_RELEASE).el6.x86_64.rpm ] || \
		rpmbuild -ba --quiet varnish-$(VARNISH_VERSION).spec 2> /dev/null

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
	@rm -f $(VARNISH_FILE)
	@rm -Rf *.spec
	@rm -Rf $(builddir)
	@rm -Rf rpms/
