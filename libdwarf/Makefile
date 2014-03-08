RPM_DIR 	= rpms/
RPM_RELEASE 	= 1

LIBDWARF_VERSION	= 20140208

LIBDWARF_FILE	= libdwarf-$(LIBDWARF_VERSION).tar.gz
LIBDWARF_URL	= http://pkgs.fedoraproject.org/repo/pkgs/libdwarf/libdwarf-20140208.tar.gz/4dc74e08a82fa1d3cab6ca6b9610761e/libdwarf-20140208.tar.gz


# Makefile internals from here on:

files_to_copy 	= $(LIBDWARF_FILE)	libdwarf-soname.patch


builddir	= ~/rpmbuild
rpmdir		= ~/rpmbuild/RPMS
sourcedir	= ~/rpmbuild/SOURCES
specdir		= ~/rpmbuild/SPECS

all: ship

help:
	@echo -e "libdwarf Build Suite for Evia 2"
	@echo -e "\texample usage:"
	@echo -e "\t\tmake LIBDWARF_VERSION=3.0.4"
	@echo -e "\tor just to build defaults:"
	@echo -e "\t\tmake"

download: 
	@[ ! -f $(LIBDWARF_FILE) ] && \
		echo "Downloading $(LIBDWARF_FILE)..." && \
		curl -sLO $(LIBDWARF_URL) -o $(LIBDWARF_FILE) || \
		[ -f $(LIBDWARF_FILE) ]

spec:
	@echo "Make libdwarf $(LIBDWARF_VERSION) spec file..."
	@sed -e "s/LIBDWARF_VERSION/$(LIBDWARF_VERSION)/g" \
	     -e "s/LIBDWARF_FILE/$(LIBDWARF_FILE)/g" \
	     -e "s/RPM_RELEASE/$(RPM_RELEASE)/g" \
	     libdwarf.spec.template > libdwarf-$(LIBDWARF_VERSION).spec

build: spec prereq download
	@echo "Building libdwarf $(LIBDWARF_VERSION) packages..."
	@[ ! -d $(sourcedir) ] && mkdir -p $(sourcedir) || [ -d $(sourcedir) ]
	@for file in $(files_to_copy); do \
		cp -f $$file $(sourcedir)/; \
	done
	@[ -f $(RPM_DIR)/x86_64/libdwarf-$(LIBDWARF_VERSION)-$(RPM_RELEASE).el6.x86_64.rpm ] || \
		rpmbuild -ba libdwarf-$(LIBDWARF_VERSION).spec

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
	@rm -f $(LIBDWARF_FILE)
	@rm -Rf *.spec
	@rm -Rf $(builddir)
	@rm -Rf rpms/
