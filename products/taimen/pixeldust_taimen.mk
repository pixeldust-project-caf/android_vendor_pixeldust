# Boot animation
BOOTANIMATION := 1440

# Release name
PRODUCT_RELEASE_NAME := Pixel 2 XL
export TARGET_DEVICE=taimen

# Don't include Google apex use the AOSP variant instead 
TARGET_EXCLUDE_GOOGLE_APEX := true

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# Inherit device configuration
$(call inherit-product, device/google/taimen/aosp_taimen.mk)

-include device/google/taimen/device-lineage.mk

# Device identifier. This must come after all inclusions
PRODUCT_NAME := pixeldust_taimen
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 2 XL
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=taimen \
    PRIVATE_BUILD_DESC="taimen-user 11 RP1A.201005.004.A1 6934943 release-keys"

BUILD_FINGERPRINT := google/taimen/taimen:11/RP1A.201005.004.A1/6934943:user/release-keys

$(call inherit-product-if-exists, vendor/google/taimen/taimen-vendor.mk)

# Google Apps
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)
REMOVE_GAPPS_PACKAGES += \
    DevicePersonalizationPrebuiltPixel2020 \
    DevicePolicyPrebuilt \
    DiagnosticsToolPrebuilt \
    Drive \
    FilesPrebuilt \
    GCS \
    GoogleTTS \
    Maps \
    NetworkPermissionConfigGoogle \
    NetworkStackGoogle \
    NgaResources \
    pixel_experience_2019_midyear \
    pixel_experience_2019 \
    pixel_experience_2020_midyear \
    pixel_experience_2020 \
    PrebuiltGmail \
    RecorderPrebuilt \
    SCONE \
    YouTube \
    YouTubeMusicPrebuilt \
    WellbeingPrebuilt \
    talkback
