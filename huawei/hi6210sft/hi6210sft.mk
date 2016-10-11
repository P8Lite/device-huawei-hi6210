# AAPT
PRODUCT_AAPT_CONFIG := xhdpi hdpi normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio_policy.stub \
	audio.primary.default \
	audio.r_submix.default \
	audio.usb.default \
	sound_trigger.primary.hi6210sft \
	libaudioroute \
	libaudioutils \
	libtinyalsa \
	tinycap \
	tinymix \
	tinypcminfo \
	tinyplay

# Binaries
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/huawei/hi6210sft/rootdir/bin,system/bin)

# Bluetooth
PRODUCT_PACKAGES += \
	libbt-vendor \
	bt_vendor.conf

# Charger
PRODUCT_PACKAGES += \
    	charger_res_images \
		
# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# DHCPCD
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# Display
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# File System
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs \
        com.android.future.usb.accessory

# Gello
PRODUCT_PACKAGES += \
	Gello

# GPS
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Graphics
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/lib/egl/libGLES_mali.so:system/lib/egl/libGLES_mali.so \
	$(LOCAL_PATH)/rootdir/lib/hw/gralloc.hi6210sft.so:system/lib/hw/gralloc.hi6210sft.so \
	$(LOCAL_PATH)/rootdir/lib/libion.so:system/lib/libion.so \

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/lib64/egl/libGLES_mali.so:system/lib64/egl/libGLES_mali.so \
	$(LOCAL_PATH)/rootdir/lib64/hw/gralloc.hi6210sft.so:system/lib64/hw/gralloc.hi6210sft.so \
	$(LOCAL_PATH)/rootdir/lib64/libion.so:system/lib64/libion.so \

PRODUCT_PACKAGES += \
	gralloc.hi6210sft \
	libGLES_android \
	libGLES_mali \
	libion
		
PRODUCT_PROPERTY_OVERRIDES += \
	debug.hwui.render_dirty_regions=false \
        hw.lcd.lcd_density=320 \
	persist.sys.strictmode.disable=1 \
	persist.sys.use_dithering=2 \
	ro.opengles.version=131072 \
	ro.sf.lcd_density=320

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/huawei/hi6210sft/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    	$(LOCAL_KERNEL):kernel

# Misc
PRODUCT_PROPERTY_OVERRIDES += \
    	persist.sys.root_access=1 \
    	ro.build.selinux=0
		
# Overlay
DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.external.xml:system/etc/permissions/android.hardware.camera.external.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.manual_postprocessing.xml:system/etc/permissions/android.hardware.camera.manual_postprocessing.xml \
	frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
	frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \

# Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ramdisk/fstab.hi6210sft:root/fstab.hi6210sft \
	$(LOCAL_PATH)/ramdisk/init.5801.rc:root/init.5801.rc \
	$(LOCAL_PATH)/ramdisk/init.6165.rc:root/init.6165.rc \
	$(LOCAL_PATH)/ramdisk/init.10106.rc:root/init.10106.rc \
	$(LOCAL_PATH)/ramdisk/init.51054.rc:root/init.51054.rc \
	$(LOCAL_PATH)/ramdisk/init.102173.rc:root/init.102173.rc \
	$(LOCAL_PATH)/ramdisk/init.142782.rc:root/init.142782.rc \
	$(LOCAL_PATH)/ramdisk/init.audio.rc:root/init.audio.rc \
	$(LOCAL_PATH)/ramdisk/init.chip.usb.rc:root/init.chip.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.connectivity.bcm43xx.rc:root/init.connectivity.bcm43xx.rc \
	$(LOCAL_PATH)/ramdisk/init.connectivity.hi110x.rc:root/init.connectivity.hi110x.rc \
	$(LOCAL_PATH)/ramdisk/init.connectivity.rc:root/init.connectivity.rc \
	$(LOCAL_PATH)/ramdisk/init.device.rc:root/init.device.rc \
	$(LOCAL_PATH)/ramdisk/init.extmodem.rc:root/init.extmodem.rc \
	$(LOCAL_PATH)/ramdisk/init.hi6210sft.rc:root/init.hi6210sft.rc \
	$(LOCAL_PATH)/ramdisk/init.hisi.rc:root/init.hisi.rc \
	$(LOCAL_PATH)/ramdisk/init.manufacture.rc:root/init.manufacture.rc \
	$(LOCAL_PATH)/ramdisk/init.performance.rc:root/init.performance.rc \
	$(LOCAL_PATH)/ramdisk/init.platform.rc:root/init.platform.rc \
	$(LOCAL_PATH)/ramdisk/init.protocol.rc:root/init.protocol.rc \
	$(LOCAL_PATH)/ramdisk/init.recovery.hi110x.rc:root/init.recovery.hi110x.rc \
	$(LOCAL_PATH)/ramdisk/init.recovery.hi6210sft.rc:root/init.recovery.hi6210sft.rc \
	$(LOCAL_PATH)/ramdisk/init.tee.rc:root/init.tee.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.hi6210sft.rc:root/ueventd.hi6210sft.rc \

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ramdisk/sbin/check_root:root/sbin/check_root \
	$(LOCAL_PATH)/ramdisk/sbin/e2fsck_s:root/sbin/e2fsck_s \
	$(LOCAL_PATH)/ramdisk/sbin/emmc_partation:root/sbin/emmc_partation \
	$(LOCAL_PATH)/ramdisk/sbin/kmsgcat:root/sbin/kmsgcat \
	$(LOCAL_PATH)/ramdisk/sbin/logctl_service:root/sbin/logctl_service \
	$(LOCAL_PATH)/ramdisk/sbin/oeminfo_nvm_server:root/sbin/oeminfo_nvm_server \
	$(LOCAL_PATH)/ramdisk/sbin/teecd:root/sbin/teecd \

# Wifi
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/etc/wifi/hostapd_hisi.conf:system/etc/wifi/hostapd_hisi.conf \
	$(LOCAL_PATH)/rootdir/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
	$(LOCAL_PATH)/rootdir/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	$(LOCAL_PATH)/rootdir/etc/wifi/wpa_supplicant_hisi.conf:system/etc/wifi/wpa_supplicant_hisi.conf \
	$(LOCAL_PATH)/rootdir/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/lib/libchrlog.so:system/lib/libchrlog.so \
	$(LOCAL_PATH)/rootdir/lib/libhisi_ini.so:system/lib/libhisi_ini.so \
	$(LOCAL_PATH)/rootdir/lib/libwifi_factory_test.so:system/lib/libwifi_factory_test.so \
	$(LOCAL_PATH)/rootdir/lib/libwifi_factory_test_hi110x.so:system/lib/libwifi_factory_test_hi110x.so \

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/lib64/libchrlog.so:system/lib64/libchrlog.so \
	$(LOCAL_PATH)/rootdir/lib64/libhisi_ini.so:system/lib64/libhisi_ini.so \
	$(LOCAL_PATH)/rootdir/lib64/libwifi_factory_test.so:system/lib64/libwifi_factory_test.so \
	$(LOCAL_PATH)/rootdir/lib64/libwifi_factory_test_hi110x.so:system/lib64/libwifi_factory_test_hi110x.so \

PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/huawei/hi6210sft/rootdir/vendor/firmware,system/vendor/firmware)

PRODUCT_PACKAGES += \
    	dhcpcd.conf \
    	hostapd \
    	libwpa_client \
    	wpa_supplicant \
	wpa_supplicant.conf
