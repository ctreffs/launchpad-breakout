LP_ROOT := launchpad-pro
SYSEX_ROOT := sysex


setupSysex:
	$(MAKE) -C $(LP_ROOT)/
	cp $(LP_ROOT)/build/launchpad_pro.syx $(SYSEX_ROOT)/launchpad_pro.syx