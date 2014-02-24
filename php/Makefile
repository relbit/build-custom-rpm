RPM_DIR 	= rpms/
RPM_RELEASE 	= 1

PHP_NAME 	= php53
PHP_VERSION 	= 5.3.28

PHP_FILE 	= php-$(PHP_VERSION).tar.bz2
PHP_URL  	= http://cz1.php.net/get/$(PHP_FILE)/from/this/mirror 

EXTRA_FILES 	= etc-init.d-php-fpm 	etc-php.ini		etc-php-fpm.conf
EXTENSIONS  	= APC-3.1.13		memcache-3.0.8		turbo_realpath-1.3

ifeq ($(PHP_NAME), php53)
  HAVE_SUHOSIN	= 1

  SUHOSIN_FILE 	= suhosin-0.9.33.tgz
  SUHOSIN_URL  	= http://download.suhosin.org/$(SUHOSIN_FILE)
  EXTENSIONS   += suhosin-0.9.33
endif

IONCUBE_FILE 	= ioncube_loaders_lin_x86-64.tar.gz
IONCUBE_VERSION	= 4.5.3
IONCUBE_URL  	= http://downloads3.ioncube.com/loader_downloads/$(IONCUBE_FILE)

# Makefile internals from here on:

files_to_copy 	= $(PHP_FILE)		$(SUHOSIN_FILE) 	$(IONCUBE_FILE) \
		  $(foreach file,$(EXTRA_FILES),"$(file) ")

builddir	= ~/rpmbuild
rpmdir		= ~/rpmbuild/RPMS
sourcedir	= ~/rpmbuild/SOURCES
specdir		= ~/rpmbuild/SPECS

all: ship

help:
	echo -e "PHP Build Suite for Evia 2"
	echo -e "\texample usage:"
	echo -e "\t\tmake PHP_NAME=php53 PHP_VERSION=5.3.28 RPM_RELEASE=1"
	echo -e "\tor just to build defaults:"
	echo -e "\t\tmake"

download: download_php download_ioncube $(foreach ext,$(EXTENSIONS),$(ext).tgz)

download_php:
	@test ! -f $(PHP_FILE) && \
		echo "Downloading $(PHP_FILE)..." && \
		curl -s -L $(PHP_URL) -o $(PHP_FILE) || true
	@echo "Done downloading $(PHP_FILE)"

download_ioncube:
	@test ! -f $(IONCUBE_FILE) && \
		echo "Downloading $(IONCUBE_FILE)..." && \
		curl -s -L $(IONCUBE_URL) -o $(IONCUBE_FILE) || true
	@echo "Done downloading $(IONCUBE_FILE)"

download_suhosin:
	@test "$(HAVE_SUHOSIN)" == "1" && \
		test ! -f $(SUHOSIN_FILE) && \
		echo "Downloading $(SUHOSIN_FILE)..." && \
		curl -s -L $(SUHOSIN_URL) -o $(SUHOSIN_FILE) || true
	@echo "Done downloading $(SUHOSIN_FILE)"

$(foreach ext,$(EXTENSIONS),$(ext).tgz): download_suhosin
	@if [ ! -f $@ ]; then \
		echo "Downloading $@..."; \
		pecl -q download `echo $@ | sed -e "s/\.tgz//g"` > /dev/null; \
		echo "$@" >> .pecl_downloaded; \
	fi; 
	@echo "Done downloading $@"

spec: spec_php spec_ext

spec_php:
	@echo "Make PHP $(PHP_VERSION) spec..."
	@yum install rpm-build yum-utils -y -q > /dev/null 2>&1
	@sed -e "s/PHP_FILE/$(PHP_FILE)/g" \
	     -e "s/PHP_NAME/$(PHP_NAME)/g" \
	     -e "s/PHP_VERSION/$(PHP_VERSION)/g" \
	     -e "s/RPM_RELEASE/$(RPM_RELEASE)/g" \
		php.spec.template > php-$(PHP_VERSION).spec
	@echo "Done making PHP $(PHP_VERSION) spec"

build_php: download_php spec_php prereq
	@echo "Building PHP $(PHP_VERSION) packages..."
	@test ! -d $(sourcedir) && mkdir -p $(sourcedir) || test -d $(sourcedir)
	@for file in $(files_to_copy); do \
		cp $$file $(sourcedir)/; \
	done
	@test -f $(rpmdir)/x86_64/$(PHP_NAME)-common-$(PHP_VERSION)-$(RPM_RELEASE).x86_64.rpm || \
		rpmbuild -ba php-$(PHP_VERSION).spec --quiet 2> /dev/null
	@echo "Done building PHP $(PHP_VERSION) packages"

inst_php: build_php
	@echo -en "Installing just built PHP..." && \
	test "`rpm -qa | grep php`" != "" && yum remove -y -q `rpm -qa | grep php` || true
	@test -f $(rpmdir)/x86_64/$(PHP_NAME)-common-$(PHP_VERSION)-$(RPM_RELEASE).x86_64.rpm
	@test -f $(rpmdir)/noarch/$(PHP_NAME)-devel-$(PHP_VERSION)-$(RPM_RELEASE).noarch.rpm
	@yum localinstall -y -q \
		$(rpmdir)/x86_64/$(PHP_NAME)-common-$(PHP_VERSION)-$(RPM_RELEASE).x86_64.rpm \
		$(rpmdir)/noarch/$(PHP_NAME)-devel-$(PHP_VERSION)-$(RPM_RELEASE).noarch.rpm > /dev/null 2>&1
	@echo -en "ok.\n"
	
spec_ext: $(foreach ext,$(EXTENSIONS),$(ext).spec) spec_ioncube
$(foreach ext,$(EXTENSIONS),$(ext).spec): inst_php
	@echo "Make $@..." && \
	sapi_ver=`phpize -v | awk '$$1 ~ /PHP/ { print $$4; }'` && \
	ext_name=`echo $@ | sed -e 's/\.spec//g' \
				-e 's/-[^\-]*$$//g'` && \
	ext_ver=` echo $@ | sed -e 's/\.spec//g' \
				-e "s/$${ext_name}-//g"` && \
	sed -e "s/PHP_NAME/$(PHP_NAME)/g" \
	    -e "s/EXT_NAME/$${ext_name}/g" \
	    -e "s/EXT_VER/$${ext_ver}/g" \
	    -e "s/SAPI_VER/$${sapi_ver}/g" \
	    -e "s/RPM_RELEASE/$(RPM_RELEASE)/g" \
		php-pecl-extension.spec.template > $(PHP_NAME)-pecl-$@

spec_ioncube: inst_php
	@echo "Make $(PHP_NAME)-extra-ioncube.spec..." && \
	sapi_ver=`phpize -v | awk '$$1 ~ /PHP/ { print $$4; }'` && \
	sed -e "s/PHP_NAME/$(PHP_NAME)/g" \
	    -e "s/IONCUBE_VERSION/$(IONCUBE_VERSION)/g" \
	    -e "s/RPM_RELEASE/$(RPM_RELEASE)/g" \
	    -e "s/SAPI_VER/$${sapi_ver}/g" \
		php-extra-ioncube.spec.template > $(PHP_NAME)-extra-ioncube.spec
	@echo "Done making $(PHP_NAME)-extra-ioncube.spec"
                

build_ext: $(foreach ext,$(EXTENSIONS),$(ext).build) build_ioncube
$(foreach ext,$(EXTENSIONS),$(ext).build): download spec_ext
	@ext=`echo $@ | sed -e "s/\.build//g"` && \
	[ -f $(rpmdir)/x86_64/$(PHP_NAME)-pecl-$$ext-$(RPM_RELEASE).x86_64.rpm ] || \
	echo "Build $$ext..." && \
	cp -f $${ext}.tgz $(sourcedir)/ && \
	rpmbuild -ba $(PHP_NAME)-pecl-$${ext}.spec --quiet 2> /dev/null && \
	echo "Done building $$ext"

build_ioncube: inst_php spec_ioncube download_ioncube
	@[ -f $(rpmdir)/x86_64/$(PHP_NAME)-extra-ioncube-$(IONCUBE_VERSION)-$(RPM_RELEASE).x86_64.rpm ] || \
	echo "Build ioncube-$(IONCUBE_VERSION)..." && \
	cp -f $(IONCUBE_FILE) $(sourcedir)/ && \
	rpmbuild -ba --quiet $(PHP_NAME)-extra-ioncube.spec 2> /dev/null && \
	echo "Done building ioncube-$(IONCUBE_VERSION)"

build: build_ext

ship: build_ext
	@echo -en "Shipping:\n`find $(rpmdir) | sort`\n"
	@mkdir -p $(RPM_DIR) || true
	@cp -r $(rpmdir)/* $(RPM_DIR)/
	
prereq:
	@echo "Make sure prerequisites installed..."
	@yum groupinstall -y -q development > /dev/null 2>&1
	@yum-builddep -y -q *.spec > /dev/null 2>&1 || true

clean:
	@echo "Cleaning up..."
	@rm -f $(PHP_FILE) $(SUHOSIN_FILE) $(IONCUBE_FILE)
	@rm -Rf *.spec
	@rm -Rf $(builddir)
	@rm -Rf rpms/
	@test ! -f .pecl_downloaded || rm -f `cat .pecl_downloaded`
	@rm -f .pecl_downloaded
