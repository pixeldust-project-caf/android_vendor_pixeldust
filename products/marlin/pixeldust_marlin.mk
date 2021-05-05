# Copyright (C) 2019 The PixelDust Project
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
PRODUCT_RELEASE_NAME := PixelXL
export TARGET_DEVICE=marlin

# Use the sepolicies which are being shipped with our device
TARGET_EXCLUDE_QCOM_VENDOR_SEPOLICY := true

# Opt out from our custom cross-device sepolicy
TARGET_EXCLUDE_CUSTOM_DEVICE_SEPOLICY := true

# Inherit AOSP device configuration for marlin.
$(call inherit-product-if-exists, device/google/marlin/aosp_marlin.mk)

# Don't include Google apex use the AOSP variant instead 
TARGET_EXCLUDE_GOOGLE_APEX := true

# Ship the default pixel apns instead of Carrier configs by Google to prevent problems for legacy devices
TARGET_USE_PIXEL_APNS := true

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# Pixel 1 prebuilts
$(call inherit-product-if-exists, vendor/sailin/pixel1-prebuilts.mk)

# Google Apps
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)
include vendor/pixeldust/configs/core_gapps.mk

# Setup device specific product configuration.
PRODUCT_NAME := pixeldust_marlin
PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="spezi77" \
    ro.pixeldust.device="marlin"
