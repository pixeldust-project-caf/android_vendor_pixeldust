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
BOOTANIMATION := 1080

# Release name
PRODUCT_RELEASE_NAME := Pixel
export TARGET_DEVICE := sailfish

# We have our own power HAL
TARGET_USES_DEVICE_SPECIFIC_POWERHAL := true

# Use the AOSP stack
TARGET_USES_AOSP := true

# Use the sepolicies which are being shipped with our device
TARGET_EXCLUDE_QCOM_VENDOR_SEPOLICY := true

# Opt-out from dataservices as we have a copy of this in our DT already
TARGET_PROVIDES_DATA_SERVICES := true

# Inherit AOSP device configuration for sailfish.
$(call inherit-product-if-exists, device/google/marlin/aosp_sailfish.mk)

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# Google Apps
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)

# Include vendor blobs
$(call inherit-product-if-exists, vendor/google/sailfish/sailfish-vendor.mk)

# Setup device specific product configuration.
PRODUCT_NAME := pixeldust_sailfish
PRODUCT_BRAND := google
PRODUCT_DEVICE := sailfish
PRODUCT_MODEL := Pixel
PRODUCT_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=sailfish \
    PRIVATE_BUILD_DESC="sailfish-user 10 QP1A.191005.007.A3 5972272 release-keys"

BUILD_FINGERPRINT := google/sailfish/sailfish:10/QP1A.191005.007.A3/5972272:user/release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="spezi77" \
    ro.pixeldust.device="sailfish"
