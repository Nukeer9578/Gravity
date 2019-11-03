SDKVERSION = 11.2
SYSROOT = $(THEOS)/sdks/iPhoneOS11.2.sdk
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Gravity
Gravity_FILES = Gravity.xm
Gravity_FRAMEWORKS = UIKit CoreGraphics CoreImage CoreMotion Foundation CoreFoundation QuartzCore CydiaSubstrate
#Gravity_PRIVATE_FRAMEWORKS = PhysicsKit
Gravity_CFLAGS = -fobjc-arc -std=c++11
Gravity_LDFLAGS = -Wl,-segalign,4000
export ARCHS = arm64 arm64e #armv7
Gravity_ARCHS = arm64 arm64e #armv7
include $(THEOS_MAKE_PATH)/tweak.mk

#all::
#	@echo "[+] Copying Files..."
#	@ldid -S ./.theos/obj/Gravity.dylib
#	@cp ./.theos/obj/Gravity.dylib //Library/MobileSubstrate/DynamicLibraries/Gravity.dylib
#	@cp ./Gravity.plist //Library/MobileSubstrate/DynamicLibraries/Gravity.plist
#	@echo "DONE"
#	@killall SpringBoard

after-install::
	install.exec "killall -9 SpringBoard"
#SUBPROJECTS += gravitysettings
include $(THEOS_MAKE_PATH)/aggregate.mk
