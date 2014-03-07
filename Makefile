ROOTDIR = $(shell pwd)/
-include $(ROOTDIR)Makefile.includes_general

PACKAGES = $(shell find . -mindepth 2 -maxdepth 2 -type f -name Makefile | sed -e 's/^\.\///g' -e 's/\/Makefile$$//g' | grep -v _skel | sort)

clean_PACKAGES = $(addprefix clean_,$(PACKAGES))

$(clean_PACKAGES):
	$Vpackage="$(patsubst clean_%,%,$@)"; \
	cd $$package; \
	echo "[Master:Clean] $$package"; \
	$(MAKE) clean $(MFLAGS) $(SILENTOUT); \
	cd ..


clean:$(clean_PACKAGES)

build_PACKAGES = $(addprefix build_,$(PACKAGES))

$(build_PACKAGES):
	$Vpackage="$(patsubst build_%,%,$@)"; \
	cd $$package; \
	echo "[Master:Build] $$package"; \
	$(MAKE) build_default $(MFLAGS); \
	cd ..

build:$(build_PACKAGES)

install_PACKAGES = $(addprefix install_,$(PACKAGES))

$(install_PACKAGES):
	$Vpackage="$(patsubst install_%,%,$@)"; \
	cd $$package; \
	echo "[Master:Install] $$package"; \
	$(MAKE) install_default $(MFLAGS); \
	cd ..

install:$(install_PACKAGES)

