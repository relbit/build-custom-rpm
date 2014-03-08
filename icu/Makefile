ifeq ($(wildcard ../Makefile.includes),) 
include ../Makefile.includes
endif

PACKAGE_NAME	= International Components for Unicode
RPM_DIR 	= rpms/
RPM_RELEASE 	= 1

LIBICU_VERSION	= 

LIBICU_FILE	= icu-$(LIBICU_VERSION).tar.gz
LIBICU_URL	= https://launchpad.net/icu/1.0/1.0.18/+download/$(LIBICU_FILE)


# Makefile internals from here on:

files_to_copy 	= $(LIBICU_FILE)

builddir	= ~/rpmbuild
rpmdir		= ~/rpmbuild/RPMS
sourcedir	= ~/rpmbuild/SOURCES
specdir		= ~/rpmbuild/SPECS

all: ship

help:
	@echo -e "International Components for Unicode Build Suite for Evia 2"
	@echo -e "\texample usage:"
	@echo -e "\t\tmake LIBICU_VERSION=3.0.4"
	@echo -e "\tor just to build defaults:"
	@echo -e "\t\tmake"

download: 
	@[ ! -f $(LIBICU_FILE) ] && \
		echo "Downloading $(LIBICU_FILE)..." && \
		curl -sLO $(LIBICU_URL) -o $(LIBICU_FILE) || \
		[ -f $(LIBICU_FILE) ]

spec:
	@echo "Make icu $(LIBICU_VERSION) spec file..."
	@sed -e "s/LIBICU_VERSION/$(LIBICU_VERSION)/g" \
	     -e "s/LIBICU_FILE/$(LIBICU_FILE)/g" \
	     -e "s/RPM_RELEASE/$(RPM_RELEASE)/g" \
	     icu.spec.template > icu-$(LIBICU_VERSION).spec

build: spec prereq download
	@echo "Building icu $(LIBICU_VERSION) packages..."
	@[ ! -d $(sourcedir) ] && mkdir -p $(sourcedir) || [ -d $(sourcedir) ]
	@for file in $(files_to_copy); do \
		cp -f $$file $(sourcedir)/; \
	done
	@[ -f $(RPM_DIR)/x86_64/icu-$(LIBICU_VERSION)-$(RPM_RELEASE).el6.x86_64.rpm ] || \
		rpmbuild -ba icu-$(LIBICU_VERSION).spec

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
	@rm -f $(LIBICU_FILE)
	@rm -Rf *.spec
	@rm -Rf $(builddir)
	@rm -Rf rpms/
