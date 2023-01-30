

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_as_supl.mk)

$(call inherit-product, build/target/product/full.mk)

#DEVICE_PACKAGE_OVERLAYS += device/samsung/gtexsltedd/overlay




# This device is hdpi
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi


# Media config
MEDIA_CONFIGS := \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_CONFIGS),$(f):system/etc/$(notdir $(f)))


# Audio policy config
AUDIO_POLICY_CONFIGS := \
	frameworks/av/services/audiopolicy/config/audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/audio_policy_configuration_stub.xml \
	frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml \
	frameworks/av/services/audiopolicy/config/default_volume_tables.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(AUDIO_POLICY_CONFIGS),$(f):system/etc/$(notdir $(f)))


# Permissions
PERMISSION_XML_FILES := \
	frameworks/native/data/etc/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.software.sip.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.software.midi.xml


PRODUCT_COPY_FILES += \
	$(foreach f,$(PERMISSION_XML_FILES),$(f):system/etc/permissions/$(notdir $(f)))

# enabling fs_config overriding with a customised android_filesystem_config.h 
PRODUCT_PACKAGES += fs_config_dirs fs_config_files

PRODUCT_PACKAGES += \
	ThemeInterfacer \


# Selinux
PRODUCT_PACKAGES += \
	file_contexts.bin \
	sepolicy \

# Codecs
PRODUCT_PACKAGES += \
	libstagefright_avc_common \
	libstagefright_enc_common \
	libstagefright_amrnb_common \
	libstagefright_foundation \
	libstagefright_httplive \
	libstagefright_http_support \
	libstagefrighthw \
	libstagefright_omx \
	libstagefright \
	libstagefright_sprd_soft_mpeg4dec \
	libstagefright_sprd_soft_h264dec \
	libstagefright_sprd_mpeg4dec \
	libstagefright_sprd_mpeg4enc \
	libstagefright_sprd_h264dec \
	libstagefright_sprd_h264enc \
	libstagefright_sprd_vpxdec \
	libstagefright_sprd_mp3dec \
	libstagefright_soft_avcdec \
	libstagefright_soft_avcenc \
	libstagefright_soft_aacdec \
	libstagefright_soft_aacenc \
	libstagefright_soft_amrdec \
	libstagefright_soft_amrnbenc \
	libstagefright_soft_amrwbenc \
	libstagefright_soft_flacdec \
	libstagefright_soft_flacenc \
	libstagefright_soft_g711dec \
	libstagefright_soft_gsmdec \
	libstagefright_soft_hevcdec \
	libstagefright_soft_mpeg4dec \
	libstagefright_soft_mpeg4enc \
	libstagefright_soft_mp3dec \
	libstagefright_soft_mpeg2dec \
	libstagefright_soft_vpxdec \
	libstagefright_soft_vpxenc \
	libstagefright_soft_h264dec \
	libstagefright_soft_h264enc \
	libstagefright_soft_opusdec \
	libstagefright_soft_rawdec \
	libstagefright_soft_vorbisdec \
	libstagefright_wfd \
	libstagefright_yuv

	#libstagefright_shim \

# Graphics & HWC
PRODUCT_PACKAGES += \
	libHWCUtils \
	hwcomposer.sc8830 \
	sprd_gsp.sc8830 \
	gralloc.sc8830.so \
	libGLES_mali.so \

PRODUCT_PACKAGES += \
	memtrack.sc8830 \
	libmemtrack \
	libion

# Power
PRODUCT_PACKAGES += \
	power.goldfish \
	libpower

# GPS
PRODUCT_PACKAGES += \
	gps.goldfish

#	atd \
#	libgpspc \
#	libgps_shim \

PRODUCT_PACKAGES += \
	libhealthd.sc8830 \

# Usb accessory
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Bluetooth
PRODUCT_PACKAGES += \
	libbluetooth_jni \
	bluetooth.default \
	audio.a2dp.default \

# Lights
PRODUCT_PACKAGES += \
	lights.goldfish


#PRODUCT_PACKAGES += \
#	libsprd_agps_agent

# Trustzone
PRODUCT_PACKAGES += \
	libtrusty


# Audio
PRODUCT_PACKAGES += \
	audio.primary.goldfish \
	libaudio-resampler \
	libeng-audio \
	libtinyalsa \
	audio.r_submix.default \
	audio.usb.default \

	#libatchannel_wrapper \
	#audio_vbc_eq \

# Camera
PRODUCT_PACKAGES += \
	camera.goldfish \
	camera.goldfish.jpeg


# Wifi
PRODUCT_PACKAGES += \
	wpa_supplicant \
	hostapd \
	wifi-service \
	libwifi-service \


# Vibrator
PRODUCT_PACKAGES += \
	vibrator.default \
	vibrator.goldfish

# Sensor
PRODUCT_PACKAGES += \
	sensors.goldfish

# DRM
PRODUCT_PACKAGES += \
	libfwdlockengine \
	libstlport

# Legacy
PRODUCT_PACKAGES += \
	libhardware_legacy \

# Default
PRODUCT_PACKAGES += \
	keystore.default \
	local_time.default \

##############################################################


PRODUCT_PROPERTY_OVERRIDES += \
	ro.cmlegal.url=https://lineageos.org/legal \
	ro.lineageoms.version=$(LINEAGE_VERSION) \



PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp,adb \
	telephony.lteOnCdmaDevice=0 \
	persist.radio.apm_sim_not_pwdn=1 \
	persist.radio.add_power_save=1 \
	rild.libpath=/system/lib/libsec-ril.so \
	ro.radio.noril=no

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1 \
	ro.sys.sdcardfs=true \


# setting the two properties below to allow connections via adb as root to device without authentication, for the purpose of testing, but it seems to have no effect
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
#	ro.adb.secure=0 \
#	ro.secure=0



# Dalvik Heap config
include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

include device/samsung/gtexsltedd/proprietary.mk

PRODUCT_NAME := full_gtexsltedd
PRODUCT_DEVICE := gtexsltedd
