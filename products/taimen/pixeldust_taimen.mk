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
#  limitations under the License.

# Boot animation
BOOTANIMATION := 1440

# Release name
PRODUCT_RELEASE_NAME := Pixel2XL
export TARGET_DEVICE=taimen

# Use the sepolicies which are being shipped with our device
TARGET_EXCLUDE_QCOM_VENDOR_SEPOLICY := true

# Inherit from those products. Most specific first.
$(call inherit-product-if-exists, device/google/taimen/aosp_taimen.mk)
$(call inherit-product-if-exists, device/google/wahoo/device-pixeldust.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# Google Apps
$(call inherit-product-if-exists, vendor/gapps/gapps.mk)
REMOVE_GAPPS_PACKAGES += \
	PrebuiltGmail \
	MatchmakerPrebuiltPixel4 \
	NexusLauncherRelease

# Device identifier. This must come after all inclusions
PRODUCT_NAME := pixeldust_taimen
PRODUCT_DEVICE := taimen
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 2 XL

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="taimen" \
    PRIVATE_BUILD_DESC="taimen-user 11 RD1A.200810.020 6792687 release-keys"

BUILD_FINGERPRINT="google/taimen/taimen:11/RD1A.200810.020/6792687:user/release-keys"
BUILD_THUMBPRINT="11/RD1A.200810.020/6792687:user/release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="nitin1438" \
    ro.pixeldust.device="taimen"

# Vendor
$(call inherit-product-if-exists, vendor/google/taimen/taimen-vendor.mk)
