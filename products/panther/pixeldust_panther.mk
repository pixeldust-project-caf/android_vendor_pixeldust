#
# Copyright (C) 2022 The PixelDust Project
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

#
# All components inherited here go to product image
#
$(call inherit-product, vendor/pixeldust/build/product/pixeldust_product.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit AOSP stuff
$(call inherit-product, device/google/gs201/custom_common.mk)
$(call inherit-product, device/google/pantah/device-custom.mk)
$(call inherit-product, device/google/pantah/aosp_panther.mk)
$(call inherit-product, vendor/pixeldust/configs/telephony.mk)

# Release name
export TARGET_DEVICE=panther

LOCAL_KERNEL := true

# Bootanimation
BOOTANIMATION := 1080

# Google vendor
PRODUCT_RESTRICT_VENDOR_FILES := false
$(call inherit-product, vendor/google/panther/panther-vendor.mk)

# Google Apps
WITH_GMS := true
#DEVICE_REQUIRES_CARRIER_APPS := true

# Remove experience configs from older devices
REMOVE_GAPPS_PACKAGES += \
    pixel_2016_exclusive \
    pixel_experience_2017 \
    pixel_experience_2018 \
    pixel_2018_exclusive \
    pixel_experience_2019 \
    pixel_experience_2019_midyear \
    pixel_experience_2020_midyear \
    pixel_experience_2020 \
    pixel_experience_2021_midyear \
    pixel_experience_2021

# Product properties
PRODUCT_NAME := pixeldust_panther
PRODUCT_DEVICE := panther
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 7
PRODUCT_MANUFACTURER := Google

PRODUCT_GMS_CLIENTID_BASE := android-google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=panther \
    PRIVATE_BUILD_DESC="panther-user 13 TQ1A.230205.002 9471150 release-keys"

BUILD_FINGERPRINT := $(PRODUCT_OVERRIDE_FINGEPRINT)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.pixeldust.maintainer="spezi77"
