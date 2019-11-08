LP_ROOT := launchpad-pro
SYSEX_ROOT := sysex

cleanLaunchPad:
	$(MAKE) -C $(LP_ROOT)/ clean

setupSysex: cleanLaunchPad
	$(MAKE) -C $(LP_ROOT)/ all 
	cp $(LP_ROOT)/build/launchpad_pro.syx $(SYSEX_ROOT)/launchpad_pro.syx

openXcode:
	open launchpad-pro/tools/osx/simulator.xcodeproj