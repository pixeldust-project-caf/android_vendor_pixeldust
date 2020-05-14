# Boot animation
BOOTANIMATION := 1920

# Inherit some common AOSiP stuff.
$(call inherit-product, vendor/pixeldust/configs/pixeldust_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/walleye/aosp_walleye.mk)

include device/google/wahoo/device-aosip.mk

# Device identifier. This must come after all inclusions
PRODUCT_NAME := pixeldust_walleye
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 2
PRODUCT_RESTRICT_VENDOR_FILES := false
TARGET_DEVICE := walleye

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=walleye \
    PRIVATE_BUILD_DESC="walleye-user 10 QQ2A.200501.001.B3 6396602 release-keys"

BUILD_FINGERPRINT := google/walleye/walleye:10/QQ2A.200501.001.B3/6396602:user/release-keys

$(call inherit-product-if-exists, vendor/google/walleye/walleye-vendor.mk)
$(call inherit-product-if-exists, vendor/gapps/gapps.mk)
