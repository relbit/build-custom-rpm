RPM_DIR 	= rpms/
RPM_RELEASE 	= 1

TBB_MAJOR	= 4
TBB_MINOR	= 2
TBB_RELEASEDATE = 20140122
TBB_VERSION	= $(TBB_MAJOR).$(TBB_MINOR)-$(TBB_RELEASEDATE)

TBB_FILE	= tbb$(TBB_MAJOR)$(TBB_MINOR)_$(TBB_RELEASEDATE)oss_src.tgz
TBB_URL		= https://www.threadingbuildingblocks.org/sites/default/files/software_releases/source/$(TBB_FILE)


# Makefile internals from here on:

files_to_copy 	= $(TBB_FILE)

builddir	= ~/rpmbuild
rpmdir		= ~/rpmbuild/RPMS
sourcedir	= ~/rpmbuild/SOURCES
specdir		= ~/rpmbuild/SPECS

all: ship

help:
	@echo -e "tbb Build Suite for Evia 2"
	@echo -e "\texample usage:"
	@echo -e "\t\tmake TBB_VERSION=3.0.4"
	@echo -e "\tor just to build defaults:"
	@echo -e "\t\tmake"

download: 
	@[ ! -f $(TBB_FILE) ] && \
		echo "Downloading $(TBB_FILE)..." && \
		curl -sLO $(TBB_URL) -o $(TBB_FILE) || \
		[ -f $(TBB_FILE) ]

spec:
	@echo "Make tbb $(TBB_VERSION) spec file..."
	@sed -e "s/TBB_MAJOR/$(TBB_MAJOR)/g" \
	     -e "s/TBB_MINOR/$(TBB_MINOR)/g" \
	     -e "s/TBB_RELEASEDATE/$(TBB_RELEASEDATE)/g" \
	     -e "s/TBB_FILE/$(TBB_FILE)/g" \
	     -e "s/RPM_RELEASE/$(RPM_RELEASE)/g" \
	     tbb.spec.template > tbb-$(TBB_VERSION).spec

build: spec prereq download
	@echo "Building tbb $(TBB_VERSION) packages..."
	@[ ! -d $(sourcedir) ] && mkdir -p $(sourcedir) || [ -d $(sourcedir) ]
	@for file in $(files_to_copy); do \
		cp -f $$file $(sourcedir)/; \
	done
	@[ -f $(RPM_DIR)/x86_64/tbb-$(TBB_VERSION)-$(RPM_RELEASE).el6.x86_64.rpm ] || \
		rpmbuild -ba tbb-$(TBB_VERSION).spec

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
	@rm -f $(TBB_FILE)
	@rm -Rf *.spec
	@rm -Rf $(builddir)
	@rm -Rf rpms/
