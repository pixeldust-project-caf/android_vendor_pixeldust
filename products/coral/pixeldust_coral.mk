# Copyright (C) 2020 The PixelDust Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Bootanimation
BOOTANIMATION := 1440

# Release name
PRODUCT_RELEASE_NAME := Pixel 4 XL
export TARGET_DEVICE := coral

# We have our own power HAL
TARGET_USES_DEVICE_SPECIFIC_POWERHAL := false

# Use the AOSP stack
TARGET_USES_AOSP := true

# Use the sepolicies which are being shipped with our device
TARGET_EXCLUDE_QCOM_VENDOR_SEPOLICY := true

# Inherit from those products. Most specific first.
$(call inherit-product-if-exists, device/google/coral/aosp_coral.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

#New Google Assistant
TARGET_SUPPORTS_NGA := true

# Google Apps
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := pixeldust_coral
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 4 XL
PRODUCT_DEVICE := coral

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="fKm" \
    ro.pixeldust.device="coral"

# Vendor
$(call inherit-product-if-exists, vendor/google/coral/coral-vendor.mk)
