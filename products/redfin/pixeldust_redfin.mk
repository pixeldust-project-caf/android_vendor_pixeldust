# Copyright (C) 2021 The PixelDust Project
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

#
# This file is the build configuration for an aosp Android
# build for marlin hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, aosp and du, hence its name.

# Bootanimation
BOOTANIMATION := 1440

export TARGET_DEVICE := redfin

# Inherit from those products. Most specific first.
$(call inherit-product, device/google/redfin/aosp_redfin.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# New Google Assistant
TARGET_SUPPORTS_NGA := true

# Device identifier. This must come after all inclusions
PRODUCT_NAME := pixeldust_redfin
PRODUCT_DEVICE := redfin
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 5
PRODUCT_SYSTEM_BRAND := google
PRODUCT_SYSTEM_MANUFACTURER := Google

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="jacks84" \
    ro.pixeldust.device="redfin"

$(call inherit-product-if-exists, vendor/google/redfin/redfin-vendor.mk)
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)
