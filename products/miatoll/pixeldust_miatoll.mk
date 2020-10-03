#
# Copyright (C) 2020 PixelDust Project
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may 
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software 
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT 
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the 
# License for the specific language governing permissions and
#  limitations under the License.

# Bootanimation
BOOTANIMATION := 1080

# Release name
PRODUCT_RELEASE_NAME := Miatoll
export TARGET_DEVICE := Miatoll

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# Setup dalvik vm configs
$(call inherit-product, vendor/pixeldust/configs/phone-xhdpi-4096-dalvik-heap.mk)

# Indicate that we use AOSP surfaceflinger
TARGET_USE_AOSP_SURFACEFLINGER := true

# Inherit from miatoll  device
$(call inherit-product, device/xiaomi/miatoll/device.mk)

# faceunlck
$(call inherit-product-if-exists, external/motorola/faceunlock/config.mk)

# Device identifier
PRODUCT_NAME := pixeldust_miatoll
PRODUCT_DEVICE := miatoll
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := SM6250
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="GrettoRosella" \
    ro.pixeldust.device="Miatoll"

# Google Apps
$(call inherit-product-if-exists, vendor/gapps/gapps.mk)
TARGET_GAPPS_ARCH := arm64
TARGET_INCLUDE_STOCK_ARCORE := true
REMOVE_GAPPS_PACKAGES += \
    PrebuiltGmail \
    GoogleCamera \
    NexusLauncherRelease
