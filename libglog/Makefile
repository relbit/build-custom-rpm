RPM_DIR 	= rpms/
RPM_RELEASE 	= 1

LIBGLOG_VERSION	= 0.3.3
LIBGLOG_FILE	= glog-$(LIBGLOG_VERSION).tar.gz
LIBGLOG_URL	= https://google-glog.googlecode.com/files/$(LIBGLOG_FILE)


# Makefile internals from here on:

files_to_copy 	= $(LIBGLOG_FILE)

builddir	= ~/rpmbuild
rpmdir		= ~/rpmbuild/RPMS
sourcedir	= ~/rpmbuild/SOURCES
specdir		= ~/rpmbuild/SPECS

all: ship

help:
	@echo -e "libglog Build Suite for Evia 2"
	@echo -e "\texample usage:"
	@echo -e "\t\tmake LIBGLOG_VERSION=3.0.4"
	@echo -e "\tor just to build defaults:"
	@echo -e "\t\tmake"

download: 
	@[ ! -f $(LIBGLOG_FILE) ] && \
		echo "Downloading $(LIBGLOG_FILE)..." && \
		curl -sLO $(LIBGLOG_URL) -o $(LIBGLOG_FILE) || \
		[ -f $(LIBGLOG_FILE) ]

spec:
	@echo "Make libglog $(LIBGLOG_VERSION) spec file..."
	@sed -e "s/LIBGLOG_VERSION/$(LIBGLOG_VERSION)/g" \
	     -e "s/LIBGLOG_FILE/$(LIBGLOG_FILE)/g" \
	     -e "s/RPM_RELEASE/$(RPM_RELEASE)/g" \
	     libglog.spec.template > libglog-$(LIBGLOG_VERSION).spec

build: spec prereq download
	@echo "Building libglog $(LIBGLOG_VERSION) packages..."
	@[ ! -d $(sourcedir) ] && mkdir -p $(sourcedir) || [ -d $(sourcedir) ]
	@for file in $(files_to_copy); do \
		cp -f $$file $(sourcedir)/; \
	done
	@[ -f $(RPM_DIR)/x86_64/libglog-$(LIBGLOG_VERSION)-$(RPM_RELEASE).el6.x86_64.rpm ] || \
		rpmbuild -ba libglog-$(LIBGLOG_VERSION).spec

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
	@rm -f $(LIBGLOG_FILE)
	@rm -Rf *.spec
	@rm -Rf $(builddir)
	@rm -Rf rpms/
