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
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

#
# All components inherited here go to system_ext image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

#
# All components inherited here go to product image
#
$(call inherit-product, vendor/pixeldust/build/product/pixeldust_product.mk)

#
# All components inherited here go to vendor image
#
# TODO(b/136525499): move *_vendor.mk into the vendor makefile later
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_vendor.mk)

# Release name
export TARGET_DEVICE=raven

# Bootanimation
BOOTANIMATION := 1440

# Google Apex
WITH_GOOGLE_APEX := true

# Product properties
PRODUCT_NAME := pixeldust_raven
PRODUCT_DEVICE := raven
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 6 Pro
PRODUCT_MANUFACTURER := Google

# Inherit AOSP stuff
$(call inherit-product, vendor/pixeldust/configs/telephony.mk)
$(call inherit-product, device/google/raviole/aosp_raven.mk)

# Override device name for Play Store.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=Pixel6Pro

$(call inherit-product, vendor/google/raven/raven-vendor.mk)
