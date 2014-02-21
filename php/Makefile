RPM_DIR 	= rpms/
RPM_RELEASE 	= 1

PHP_NAME 	= php53
PHP_VERSION 	= 5.3.28

PHP_FILE 	= php-$(PHP_VERSION).tar.bz2
PHP_URL  	= http://cz1.php.net/get/$(PHP_FILE)/from/this/mirror 

EXTRA_FILES 	= etc-init.d-php-fpm 	etc-php-fpm.conf 	etc-php.ini
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
		  $(foreach ext,$(EXTENSIONS),"$(ext).tgz ") \
		  $(foreach file,$(EXTRA_FILES),"$(file) ")

pecl_downloaded =

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

download: download_php download_ext

download_php:
	@test ! -f $(PHP_FILE) && \
		echo "Downloading $(PHP_FILE)..." && \
		curl -s -L $(PHP_URL) -o $(PHP_FILE) || true

download_ext:
	@test ! -f $(IONCUBE_FILE) && \
		echo "Downloading $(IONCUBE_FILE)..." && \
		curl -s -L $(IONCUBE_URL) -o $(IONCUBE_FILE) || true
	@test "$(HAVE_SUHOSIN)" == "1" && \
		test ! -f $(SUHOSIN_FILE) && \
		echo "Downloading $(SUHOSIN_FILE)..." && \
		curl -s -L $(SUHOSIN_URL) -o $(SUHOSIN_FILE) || true
	@for extension in $(EXTENSIONS); do \
		if [ ! -f $${extension}.tgz ]; then \
			pecl -q download $$extension; \
			echo "$${extension}.tgz" >> .pecl_downloaded; \
		fi; \
	done

spec: spec_php spec_ext

spec_php:
	@echo "Make PHP $(PHP_VERSION) spec file..."
	@yum install rpm-build yum-utils -y -q > /dev/null 2>&1
	@./makespec-php $(PHP_NAME) $(PHP_VERSION) $(RPM_RELEASE) $(PHP_FILE) $(EXTRA_FILES)

build_php: download spec_php prereq
	@echo "Building PHP $(PHP_VERSION) packages..."
	@test ! -d $(sourcedir) && mkdir -p $(sourcedir) || test -d $(sourcedir)
	@for file in $(files_to_copy); do \
		cp $$file $(sourcedir)/; \
	done
	@test -f $(rpmdir)/x86_64/$(PHP_NAME)-common-$(PHP_VERSION)-$(RPM_RELEASE).x86_64.rpm || \
		rpmbuild --quiet -ba php-$(PHP_VERSION).spec 2> /dev/null

inst_php: build_php
	@echo "Installing just built PHP..." && \
	test "`rpm -qa | grep php`" != "" && yum remove -y -q `rpm -qa | grep php` || true
	@test -f $(rpmdir)/x86_64/$(PHP_NAME)-common-$(PHP_VERSION)-$(RPM_RELEASE).x86_64.rpm
	@test -f $(rpmdir)/noarch/$(PHP_NAME)-devel-$(PHP_VERSION)-$(RPM_RELEASE).noarch.rpm
	@yum localinstall -y -q \
		$(rpmdir)/x86_64/$(PHP_NAME)-common-$(PHP_VERSION)-$(RPM_RELEASE).x86_64.rpm \
		$(rpmdir)/noarch/$(PHP_NAME)-devel-$(PHP_VERSION)-$(RPM_RELEASE).noarch.rpm > /dev/null 2>&1
	
spec_ext: inst_php
	@for ext in $(EXTENSIONS); do \
		echo "Make $$ext spec file..."; \
		ext_name=`echo $$ext | sed 's/-[^\-]*$$//g'`; \
		ext_ver=`echo $$ext | sed "s/$${ext_name}-//g"`; \
		./makespec-pecl $(PHP_NAME) $${ext_name} $${ext_ver} $(RPM_RELEASE) $${ext}.tgz; \
	done
	@./makespec-ioncube $(PHP_NAME) $(IONCUBE_VERSION)  $(RPM_RELEASE) $(IONCUBE_FILE)

build_ext: spec_ext prereq
	@echo "Building extensions..."
	@for ext in $(EXTENSIONS); do \
		echo $$ext...; \
		test -f $(rpmdir)/x86_64/$(PHP_NAME)-pecl-$$ext-$(RPM_RELEASE).x86_64.rpm || \
			rpmbuild -ba --quiet $(PHP_NAME)-pecl-$${ext}.spec 2> /dev/null; \
	done
	@test -f $(rpmdir)/x86_64/$(PHP_NAME)-extra-ioncube-$(IONCUBE_VERSION)-$(RPM_RELEASE).x86_64.rpm || \
		echo "ioncube-$(IONCUBE_VERSION)..." && \
		rpmbuild -ba --quiet $(PHP_NAME)-extra-ioncube.spec 2> /dev/null

build: build_ext

ship: build_ext
	@echo -en "Shipping:\n`find $(rpmdir) | sort`\n"
	@mkdir -p $(RPM_DIR) || true
	@cp -rf `find $(rpmdir)` $(RPM_DIR)/
	
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
