ROOTDIR = $(shell pwd)/
MAKEDIR = $(shell pwd)/.make/
-include $(MAKEDIR)Makefile.includes_general

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

help:
	$(HELP)"Evia RPM Build Root\n"
	$(HELP)"\t\n"
	$(HELP)"Global options\n"
	$(HELP)"\t[VERBOSE=1]	Verbose operation\n"
	$(HELP)"\t\n"
	$(HELP)"Global make targets\n"
	$(HELP)"\tbuild		Build all packages\n"
	$(HELP)"\tinstall\t	Install all packages\n"
	$(HELP)"\tuninstall	Uninstall all packages, asks!\n"
	$(HELP)"\tclean		Clean the build root\n"
	$(HELP)"\tmrproper	Uninstall and clean + delete $(rpmbuild)\n"
	$(HELP)"\thelp\n"
	$(HELP)"\t\n"
	$(HELP)"How to build a package\n"
	$(HELP)"\tcd <your package>\n"
	$(HELP)"\tmake help\n"

