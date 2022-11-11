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
# All components inherited here go to system image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline_system.mk)

#
# All components inherited here go to system_ext image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

#
# All components inherited here go to product image
#
$(call inherit-product, vendor/pixeldust/build/product/pixeldust_product.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from the custom device configuration.
$(call inherit-product, device/google/gs201/common.mk)
$(call inherit-product, device/google/cheetah/device-custom.mk)
$(call inherit-product, device/google/cheetah/aosp_panther.mk)

# Release name
export TARGET_DEVICE=panther

# Bootanimation
BOOTANIMATION := 1080

# Google Apps
WITH_GMS := true
DEVICE_REQUIRES_CARRIER_APPS := true

# Don't use google's NetworkStack
REMOVE_GAPPS_PACKAGES += \
    NetworkPermissionConfigGoogle \
    NetworkStackGoogle

# Product properties
PRODUCT_NAME := pixeldust_panther
PRODUCT_DEVICE := panther
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 7
PRODUCT_MANUFACTURER := Google

PRODUCT_GMS_CLIENTID_BASE := android-google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=Pixel7 \
    PRIVATE_BUILD_DESC="panther-user 13 TD1A.220804.031 9071314 release-keys"

BUILD_FINGERPRINT := google/panther/panther:13/TD1A.220804.031/9071314:user/release-keys

$(call inherit-product, vendor/google/panther/panther-vendor.mk)


PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.pixeldust.maintainer="spezi77"

# Inherit AOSP stuff
$(call inherit-product, vendor/pixeldust/configs/telephony.mk)
