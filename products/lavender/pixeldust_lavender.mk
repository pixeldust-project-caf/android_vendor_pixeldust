#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit from lavender device
$(call inherit-product, device/xiaomi/lavender/device.mk)

# Inherit dalvik from native
$(call inherit-product, vendor/pixeldust/configs/phone-xhdpi-4096-dalvik-heap.mk)

# Inherit some common PixelDust stuff.
$(call inherit-product, vendor/pixeldust/configs/pixeldust_phone.mk)
$(call inherit-product, packages/apps/XiaomiParts/xiaomiparts.mk)

# Release name
PRODUCT_RELEASE_NAME := Xiaomi Redmi Note 7
export TARGET_DEVICE := Lavender

# Another Stuff for Lavender
TARGET_EXCLUDE_QCOM_VENDOR_SEPOLICY := true
TARGET_USE_AOSP_SURFACEFLINGER := true

# Device identifier. This must come after all inclusions.
BOOTANIMATION := 1080
PRODUCT_NAME := pixeldust_lavender
PRODUCT_DEVICE := lavender
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi Note 7
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=lavender \
    PRODUCT_NAME=lavender \
    PRIVATE_BUILD_DESC="lavender-user 10 QKQ1.190910.002 20.3.19 release-keys"

BUILD_FINGERPRINT := "google/coral/coral:10/QQ3A.200705.002/6506677:user/release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="RezaBagasRifaldy" \
    ro.pixeldust.device="Lavender"
