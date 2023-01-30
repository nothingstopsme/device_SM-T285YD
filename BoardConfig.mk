USE_CAMERA_STUB := true
STLPORT_FORCE_REBUILD := true

# making sure using the value of LOCAL_PATH right in this file ( no Lasy Set)
LOCAL_PATH := device/samsung/gtexsltedd
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := false
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := sc8830
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
BOARD_VENDOR := samsung

# using the patched charger from stock rom instead of the cm one
WITH_CM_CHARGER := false

BOARD_HAL_STATIC_LIBRARIES := libhealthd.$(TARGET_BOARD_PLATFORM)

#TARGET_FS_CONFIG_GEN := $(TARGET_FS_CONFIG_GEN) $(LOCAL_PATH)/config.fs
TARGET_ANDROID_FILESYSTEM_CONFIG_H := $(LOCAL_PATH)/android_filesystem_config.h

ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := 8830

BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_BASE := 0
BOARD_KERNEL_PAGESIZE := 2048

#rild
BOARD_PROVIDES_RILD := true
BOARD_PROVIDES_LIBRIL := true
BOARD_PROVIDES_LIBREFERENCE_RIL := true

# Audio
USE_XML_AUDIO_POLICY_CONF := 1
SPRD_AUDIO_USE_NEW_API := true
BOARD_USES_TINYALSA_AUDIO := true
BOARD_USES_SS_VOIP := true
BOARD_USE_LIBATCHANNEL_WRAPPER := true
#SOC_SCX30G_V2 := true

# something
# BOARD_USE_SAMSUNG_COLORFORMAT := true
BOARD_NEEDS_MEMORYHEAPION_SPRD := true
TARGET_SPRD_HARDWARE := true
TARGET_POWERHAL_VARIANT := samsung


BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5280628736
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true

TARGET_BOARD_INFO_FILE := device/samsung/gtexsltedd/board-info.txt
BOARD_EGL_CFG := hardware/sprd/gpu/mali/utgard/egl.cfg

# Graphics
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_EGL_NEEDS_HANDLE_VALUE := true
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true
TARGET_FORCE_SCREENSHOT_CPU_PATH := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
#TARGET_USES_HWC2 := true
TARGET_GPU_USE_TILE_ALIGN := true
USE_OVERLAY_COMPOSER_GPU := true
USE_UI_OVERLAY := true
USE_SPRD_DITHER := true
TARGET_GPU_PLATFORM := utgard
TARGET_USE_PREBUILT_GRALLOC := true
#TARGET_USE_PREBUILT_GRALLOC := false
#SOC_SCX30G_V2 := true

#1080 hw acceleration
BOARD_VSP_SUPPORT_1080I := true

# HWComposer
USE_SPRD_HWCOMPOSER := true
USE_OVERLAY_COMPOSER_GPU := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# COMMON_GLOBAL_CFLAGS += -DSC8830_HWC
# COMMON_GLOBAL_CFLAGS += -DBOARD_CANT_REALLOCATE_OMX_BUFFERS

BOARD_RIL_CLASS := ../../../device/samsung/gtexsltedd/ril
BOARD_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

# Bluetooth
USE_BLUETOOTH_BCM4343 := true
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_SPRD := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/gtexsltedd/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/samsung/gtexsltedd/bluetooth/libbt_vndcfg.txt
SPRD_WCNBT_CHISET := marlin
BOARD_SPRD_WCNBT_MARLIN := true
BOARD_HAVE_FM_TROUT := true
BOARD_USE_SPRD_FMAPP := true
SPRD_CP_LOG_WCN := MARLIN
WCN_EXTENSION := true

BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_2_1_DEVEL
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_sprdwl
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_sprdwl
BOARD_WLAN_DEVICE           := sc2341
WIFI_DRIVER_FW_PATH_PARAM   := "/data/misc/wifi/fwpath"
WIFI_DRIVER_FW_PATH_STA     := "sta_mode"
WIFI_DRIVER_FW_PATH_P2P     := "p2p_mode"
WIFI_DRIVER_FW_PATH_AP      := "ap_mode"
WIFI_DRIVER_MODULE_PATH     := "/lib/modules/sprdwl.ko"
WIFI_DRIVER_MODULE_NAME     := "sprdwl"

# TARGET_PREBUILT_KERNEL := kernel/samsung/gtexsltedd/arch/arm/boot/zImage

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging

SCAN_EXCLUDE_DIRS := out
FORCE_BUILD_LLVM_COMPONENTS := true

# Integrated kernel building configs
TARGET_KERNEL_VERSIONS := 3.10
TARGET_KERNEL_SOURCE := kernel/samsung/gtexsltedd
TARGET_KERNEL_CONFIG := gtexslte_rev04_defconfig
TARGET_VARIANT_CONFIG := gtexslte_rev04_defconfig
TARGET_SELINUX_CONFIG := gtexslte_rev04_defconfig
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androidkernel-
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk

# making use of lazy assignment for BOARD_CUSTOM_MKBOOTIMG
BOARD_CUSTOM_MKBOOTIMG = $(HOST_OUT_EXECUTABLES)/degas-mkbootimg

# base and pagesize have already been designated by BOARD_KERNEL_BASE and BOARD_KERNEL_PAGESIZE
# BOARD_MKBOOTIMG_ARGS := --base 0 --pagesize 2048
#BOARD_MKBOOTIMG_ARGS := --signature $(LOCAL_PATH)/seandroid.img
BOARD_KERNEL_SEPARATED_DT := true

TARGET_NO_TWO_STEP_RECOVERY := true
#TARGET_KERNEL_MODULES :=
BOARD_USES_FULL_RECOVERY_IMAGE := true
NEED_KERNEL_MODULE_ROOT := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

BOARD_SEPOLICY_DIRS += device/samsung/gtexsltedd/sepolicy

# Camera
#zsl capture
TARGET_BOARD_CAMERA_CAPTURE_MODE := false

#back camera rotation capture
TARGET_BOARD_BACK_CAMERA_ROTATION := false

#front camera rotation capture
TARGET_BOARD_FRONT_CAMERA_ROTATION := false

#rotation capture
TARGET_BOARD_CAMERA_ROTATION_CAPTURE := false

# camera sensor type
CAMERA_SENSOR_TYPE_BACK := "s5k4ecgx_mipi"
CAMERA_SENSOR_TYPE_FRONT := "sr352_mipi"

# select camera 2M,3M,5M,8M
CAMERA_SUPPORT_SIZE := 5M
FRONT_CAMERA_SUPPORT_SIZE := 2M

TARGET_BOARD_NO_FRONT_SENSOR := true
TARGET_BOARD_CAMERA_FLASH_CTRL := false

#read otp method 1:from kernel 0:from user
TARGET_BOARD_CAMERA_READOTP_METHOD := 1

#face detect
TARGET_BOARD_CAMERA_FACE_DETECT := true

#sensor interface
TARGET_BOARD_BACK_CAMERA_INTERFACE := mipi
TARGET_BOARD_FRONT_CAMERA_INTERFACE := mipi

#select camera zsl cap mode
TARGET_BOARD_CAMERA_CAPTURE_MODE := true

#select camera zsl force cap mode
TARGET_BOARD_CAMERA_FORCE_ZSL_MODE := true

#sprd zsl feature
TARGET_BOARD_CAMERA_SPRD_PRIVATE_ZSL := true

#rotation capture
TARGET_BOARD_CAMERA_ROTATION_CAPTURE := false

#select camera support autofocus
TARGET_BOARD_CAMERA_AUTOFOCUS := true

TARGET_BOARD_CAMERA_FACE_BEAUTY := false

#uv denoise enable
TARGET_BOARD_CAMERA_CAPTURE_DENOISE := false

#y denoise enable
TARGET_BOARD_CAMERA_Y_DENOISE := true

#select continuous auto focus
TARGET_BOARD_CAMERA_CAF := true

TARGET_BOARD_CAMERA_NO_FLASH_DEV := false

#image angle in different project
TARGET_BOARD_CAMERA_ADAPTER_IMAGE := 0

#pre_allocate capture memory
TARGET_BOARD_CAMERA_PRE_ALLOC_CAPTURE_MEM := true

#sc8830g isp ver 0;sc9630 isp ver 1;sp9832a_2h11 isp version 2
TARGET_BOARD_CAMERA_ISP_SOFTWARE_VERSION := 2

TARGET_BOARD_CAMERA_ISP_AE_VERSION := 0

#set hal version to 1.0
TARGET_BOARD_CAMERA_HAL_VERSION := 1.0

#support auto anti-flicker
TARGET_BOARD_CAMERA_ANTI_FLICKER := true

#multi cap memory mode
TARGET_BOARD_MULTI_CAP_MEM := true

#low capture memory
TARGET_BOARD_LOW_CAPTURE_MEM := true

#select mipi d-phy mode(none, phya, phyb, phyab)
TARGET_BOARD_FRONT_CAMERA_MIPI := phyb
TARGET_BOARD_BACK_CAMERA_MIPI := phya

#select ccir pclk src(source0, source1)
TARGET_BOARD_FRONT_CAMERA_CCIR_PCLK := source0
TARGET_BOARD_BACK_CAMERA_CCIR_PCLK := source0


# misc
TARGET_HAS_BACKLIT_KEYS := false

# RECOVERY
TARGET_RECOVERY_FSTAB := device/samsung/gtexsltedd/rootdir/boot/fstab.sc8830
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_GRAPHICS_FORCE_USE_LINELENGTH := true
RECOVERY_GRAPHICS_FORCE_SINGLE_BUFFER := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_FLIPPED_SCREEN := true

# Build system
USE_NINJA := false

# Use dmalloc() for such low memory devices like us
MALLOC_SVELTE := true
BOARD_USES_LEGACY_MMAP := true

# Bionic
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# SELinux
SERVICES_WITHOUT_SELINUX_DOMAIN := true
