# Release name
PRODUCT_RELEASE_NAME := gtexsltedd

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, vendor/cm/config/common_full_phone.mk)

$(call inherit-product, device/samsung/gtexsltedd/device_gtexsltedd.mk)

# Use specific resolution for bootanimation
TARGET_BOOTANIMATION_SIZE := 720x480

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := gtexsltedd
PRODUCT_NAME := lineage_gtexsltedd
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-T285YD
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := tablet

TARGET_SCREEN_WIDTH := 800
TARGET_SCREEN_HEIGHT := 1280
