# Include Gapps in build
TARGET_VENDOR_GOOGLE := true

# Generic aospSX product
PRODUCT_NAME := aospsx
PRODUCT_BRAND := aospsx
PRODUCT_DEVICE := generic

# Google Apps
ifeq ($(TARGET_VENDOR_GOOGLE),true)
$(call inherit-product-if-exists, vendor/google/google-vendor.mk)
else
PRODUCT_PACKAGES += \
    Provision \
    QuickSearchBox
endif

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

# T-Mobile theme engine
include vendor/aospsx/products/themes_common.mk

# Bring in all audio files
include frameworks/base/data/sounds/NewAudio.mk

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Required Common Packages
PRODUCT_PACKAGES += \
    Mms \
    Camera \
    Calendar \
    CalendarProvider \
    CellBroadcastReceiver \
    Torch \
    VideoEditor \
    VoiceDialer \
    SoundRecorder \
    FileManager \
    ZeroXBenchmark \
    Superuser \
    Superuser.apk \
    su

# Live Wallpapers
PRODUCT_PACKAGES += \
    Basic \
    PhaseBeam \
    Galaxy4 \
    HoloSpiralWallpaper \
    NoiseField \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Extras
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    OTAUpdateCenter.apk \
    tune2fs

# Backuptool
PRODUCT_COPY_FILES += \
    vendor/aospsx/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh

# init.d
PRODUCT_COPY_FILES += \
    vendor/aospsx/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/aospsx/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/aospsx/prebuilt/common/etc/init.d/99complete:system/etc/init.d/99complete \
    vendor/aospsx/prebuilt/common/bin/sysinit:system/bin/sysinit

PRODUCT_COPY_FILES += \
    vendor/aospsx/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/aospsx/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/aospsx/prebuilt/common/bin/fix_permissions:system/bin/fix_permissions

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/aospsx/prebuilt/common/bootanimation.zip:system/media/bootanimation.zip

# BT config
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

# OTA Update Helper
PRODUCT_COPY_FILES += \
    vendor/aospsx/prebuilt/common/etc/OTA-Update-helper.sh:system/etc/OTA-Update-helper.sh

PRODUCT_PACKAGE_OVERLAYS += vendor/aospsx/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/aospsx/overlay/dictionaries

# Board platforms lists to be used for
# TARGET_BOARD_PLATFORM specific featurization
QCOM_BOARD_PLATFORMS := msm7x30
QCOM_BOARD_PLATFORMS += msm8660

# aospSX Version
PRODUCT_VERSION_MAJOR = 1
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 8

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=JDQ39E

PRODUCT_PROPERTY_OVERRIDES += \
	ro.modversion=aospSX-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(PRODUCT_RELEASE_NAME) \
	otaupdater.otaid=aospSX \
	otaupdater.otatime=20180907-1630 \
	otaupdater.otaver=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE) \
	otaupdater.sdcard.recovery=cache/recovery \
	otaupdater.rebootcmd=/system/etc/OTA-Update-helper.sh \

