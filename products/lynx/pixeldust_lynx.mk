#
# Copyright (C) 2023 The PixelDust Project
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
$(call inherit-product, device/google/lynx/device-custom.mk)
$(call inherit-product, device/google/lynx/aosp_lynx.mk)
$(call inherit-product, vendor/pixeldust/configs/telephony.mk)

# Release name
export TARGET_DEVICE=lynx

LOCAL_KERNEL := true

# Bootanimation
BOOTANIMATION := 1080

# Google Apps
WITH_GMS := true

# Product properties
PRODUCT_NAME := pixeldust_lynx
PRODUCT_DEVICE := lynx
PRODUCT_BRAND := google
PRODUCT_DEVICE := lynx
PRODUCT_MANUFACTURER := Google
PRODUCT_MODEL := Pixel 7a

PRODUCT_GMS_CLIENTID_BASE := android-google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=Pixel7 \
    PRIVATE_BUILD_DESC="lynx-user 13 TQ2B.230505.005.A1 9808202 release-keys"

BUILD_FINGERPRINT := $(PRODUCT_OVERRIDE_FINGEPRINT)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.pixeldust.maintainer="spezi77"
