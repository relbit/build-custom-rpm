RPM_DIR 	= rpms/
RPM_RELEASE 	= 1

MONGODB_VERSION	= 2.4.9

MONGODB_FILE	= mongodb-src-r$(MONGODB_VERSION).tar.gz
MONGODB_URL	= http://fastdl.mongodb.org/src/$(MONGODB_FILE)


# Makefile internals from here on:

files_to_copy 	= $(MONGODB_FILE)	init.d-mongod		mongod.conf \
		  mongod.sysconfig

builddir	= ~/rpmbuild
rpmdir		= ~/rpmbuild/RPMS
sourcedir	= ~/rpmbuild/SOURCES
specdir		= ~/rpmbuild/SPECS

all: ship

help:
	@echo -e "MongoDB Build Suite for Evia 2"
	@echo -e "\texample usage:"
	@echo -e "\t\tmake MONGODB_VERSION=1.5 MONGODB_DEV=dev22"
	@echo -e "\tor just to build defaults:"
	@echo -e "\t\tmake"

download: 
	@[ ! -f $(MONGODB_FILE) ] && \
		echo "Downloading $(MONGODB_FILE)..." && \
		curl -sLO $(MONGODB_URL) -o $(MONGODB_FILE) || \
		[ -f $(MONGODB_FILE) ]

spec:
	@echo "Make MongoDB $(MONGODB_VERSION) spec file..."
	@sed -e "s/MONGODB_VERSION/$(MONGODB_VERSION)/g" \
	     -e "s/MONGODB_FILE/$(MONGODB_FILE)/g" \
	     -e "s/RPM_RELEASE/$(RPM_RELEASE)/g" \
	     mongodb.spec.template > mongodb-$(MONGODB_VERSION).spec

build: spec prereq download
	@echo "Building MongoDB $(MONGODB_VERSION) packages..."
	@[ ! -d $(sourcedir) ] && mkdir -p $(sourcedir) || [ -d $(sourcedir) ]
	@for file in $(files_to_copy); do \
		cp -f $$file $(sourcedir)/; \
	done
	#rpmbuild -ba mongodb-$(MONGODB_VERSION).spec
	@rpmbuild -ba --quiet mongodb-$(MONGODB_VERSION).spec 2> /dev/null

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
	@rm -f $(MONGODB_FILE)
	@rm -Rf *.spec
	@rm -Rf $(builddir)
	@rm -Rf rpms/
