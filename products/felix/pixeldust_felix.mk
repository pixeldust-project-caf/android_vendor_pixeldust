#
# Copyright (C) 2022-2023 The PixelDust Project
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
$(call inherit-product, device/google/felix/aosp_felix.mk)
$(call inherit-product, vendor/pixeldust/configs/telephony.mk)

# Release name
export TARGET_DEVICE=felix

LOCAL_KERNEL := true

# Bootanimation
BOOTANIMATION := 1440

# Google vendor
PRODUCT_RESTRICT_VENDOR_FILES := false

$(call inherit-product, vendor/pixeldust/configs/pixel_overlay.mk)

# Google Apps
WITH_GMS := true

# Product properties
PRODUCT_NAME := pixeldust_felix
PRODUCT_DEVICE := felix
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel Fold
PRODUCT_MANUFACTURER := Google

PRODUCT_GMS_CLIENTID_BASE := android-google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=felix \
    PRIVATE_BUILD_DESC="felix-user 14 UP1A.231105.003 11010452 release-keys"

BUILD_FINGERPRINT := $(PRODUCT_OVERRIDE_FINGEPRINT)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.pixeldust.maintainer="spezi77"