ROOTDIR = $(shell pwd)/
-include $(ROOTDIR)Makefile.includes_general

PACKAGES = $(shell find . -mindepth 2 -maxdepth 2 -type f -name Makefile | sed -e 's/^\.\///g' -e 's/\/Makefile$$//g' | grep -v _skel | sort)

clean_PACKAGES = $(addprefix clean_,$(PACKAGES))
clean:$(clean_PACKAGES)
$(clean_PACKAGES):
	$Vpackage="$(patsubst clean_%,%,$@)"; \
	cd $$package; \
	echo "[Master:Clean] $$package"; \
	$(MAKE) $(SILENTMAKE) clean $(MFLAGS); \
	cd ..



build_PACKAGES = $(addprefix build_,$(PACKAGES))
build:$(build_PACKAGES)
$(build_PACKAGES):
	$Vpackage="$(patsubst build_%,%,$@)"; \
	cd $$package; \
	echo "[Master:Build] $$package"; \
	$(MAKE) $(SILENTMAKE) build $(MFLAGS); \
	cd ..


uninstall_PACKAGES = $(addprefix uninstall_,$(PACKAGES))
uninstall:$(uninstall_PACKAGES)
$(uninstall_PACKAGES):
	$Vpackage="$(patsubst uninstall_%,%,$@)"; \
	cd $$package; \
	echo "[Master:Uninstall] $$package"; \
	$(MAKE) $(SILENTMAKE) uninstall $(MFLAGS); \
	cd ..

mrproper: uninstall
	$V$(MAKE) $(SILENTMAKE) clean $(MFLAGS)
	$Vecho "[MrProper(tm)] *** Cleaning all rpmbuild dirs ***"
	$Vrm -Rf $(builddir)
