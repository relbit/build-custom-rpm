RPM_DIR 	= rpms/
RPM_RELEASE 	= 1

RUBY_VERSION	= 2.0.0
RUBY_PATCHLEVEL = p451

RUBY_FILE	= ruby-$(RUBY_VERSION)-$(RUBY_PATCHLEVEL).tar.gz
RUBY_URL	= http://cache.ruby-lang.org/pub/ruby/2.0/$(RUBY_FILE)

# Makefile internals from here on:

files_to_copy 	= $(RUBY_FILE)

builddir	= ~/rpmbuild
rpmdir		= ~/rpmbuild/RPMS
sourcedir	= ~/rpmbuild/SOURCES
specdir		= ~/rpmbuild/SPECS

all: ship

help:
	@echo -e "Ruby 2.0 Build Suite for Evia 2"
	@echo -e "\texample usage:"
	@echo -e "\t\tmake RUBY_PATCHLEVEL=p247"
	@echo -e "\tor just to build defaults:"
	@echo -e "\t\tmake"

download: 
	@[ ! -f $(RUBY_FILE) ] && \
		echo "Downloading $(RUBY_FILE)..." && \
		curl -sLO $(RUBY_URL) -o $(RUBY_FILE) || \
		[ -f $(RUBY_FILE) ]

spec:
	@echo "Make Ruby $(RUBY_VERSION) spec file..."
	@sed -e "s/RUBY_VERSION/$(RUBY_VERSION)/g" \
	    -e "s/RUBY_PATCHLEVEL/$(RUBY_PATCHLEVEL)/g" \
	    -e "s/RPM_RELEASE/$(RPM_RELEASE)/g" \
	    ruby-2.0.spec.template > ruby-2.0.spec

build: spec prereq download
	@echo "Building Ruby $(RUBY_VERSION) packages..."
	@[ ! -d $(sourcedir) ] && mkdir -p $(sourcedir) || [ -d $(sourcedir) ]
	@cp -f $(RUBY_FILE) $(sourcedir)/
	@rpmbuild -ba --quiet ruby-2.0.spec 2> /dev/null

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
	@rm -f $(RUBY_FILE)
	@rm -Rf *.spec
	@rm -Rf $(builddir)
	@rm -Rf rpms/
