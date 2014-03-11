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

new:
	$Vecho "[Create] $(RPM_NAME)"; \
	[ "$(RPM_NAME)" == "" ] && echo "RPM_NAME not set." && exit 1; \
	[ "$(RPM_SUMMARY)" == "" ] && echo "RPM_SUMMARY not set." && exit 1; \
	[ "$(RPM_LICENSE)" == "" ] && echo "RPM_LICENSE not set." && exit 1; \
	[ "$(RPM_VERSION)" == "" ] && echo "RPM_VERSION not set." && exit 1; \
	[ "$(RPM_URL)" == "" ] && echo "RPM_URL not set." && exit 1; \
	RULESTYPE=$${RULESTYPE:-stdrules}; \
	RPM_RELEASE=$${RPM_RELEASE:-1}; \
	if [ "$$RPM_SOURCE0" != "" ]; then \
		RPM_SOURCE0="`echo $$RPM_SOURCE0 | sed \
			-e 's/$$RPM_NAME/\$$\(RPM_NAME\)/g' \
			-e 's/$$RPM_VERSION/\$$\(RPM_VERSION\)/g'`"; \
	fi; \
	RPM_SOURCE0=$${RPM_SOURCE0:-\$$\(RPM_NAME\)-\$$\(RPM_VERSION\).tar.gz}; \
	RPM_URL="`echo $$RPM_URL | sed \
		-e \"s/$$RPM_NAME/\$$\(RPM_NAME\)/g\" \
		-e \"s/$$RPM_VERSION/\$$\(RPM_VERSION\)/g\"`"; \
	mkdir -p $$RPM_NAME; \
	cp -f _skel/Makefile.$$RULESTYPE $$RPM_NAME/Makefile; \
	sed	-e "s/REPLACE_RULESTYPE/$$RULESTYPE/g" \
		-e "s/REPLACE_RPM_NAME/$$RPM_NAME/g" \
		-e "s/REPLACE_RPM_SUMMARY/$$RPM_SUMMARY/g" \
		-e "s/REPLACE_RPM_LICENSE/$$RPM_LICENSE/g" \
		-e "s/REPLACE_RPM_VERSION/$$RPM_VERSION/g" \
		-e "s/REPLACE_RPM_RELEASE/$$RPM_RELEASE/g" \
		-e "s/REPLACE_RPM_SOURCE0/$$RPM_SOURCE0/g" \
		-e "s|REPLACE_RPM_URL|$$RPM_URL|g" \
		-i $$RPM_NAME/Makefile; \
	cp -f _skel/spec.template.$$RULESTYPE $$RPM_NAME/$$RPM_NAME.spec.template;
	$Vecho "[Done] You must complete $(RPM_NAME)/$(RPM_NAME).spec.template now."

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

