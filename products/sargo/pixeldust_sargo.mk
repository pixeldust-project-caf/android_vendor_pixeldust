#
# Copyright 2016 The Android Open Source Project
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
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)

# Enable mainline checking
# TODO(b/138706293): Enable mainline checking later
# PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := relaxed

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
export TARGET_DEVICE=sargo

# Inherit AOSP stuff
$(call inherit-product, vendor/pixeldust/configs/telephony.mk)

# Bootanimation
BOOTANIMATION := 1080

# Enable legacy IMS patch
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.telephony.block_binder_thread_on_incoming_calls=false

# Google Apps
WITH_GMS := true
DEVICE_REQUIRES_CARRIER_APPS := true
REMOVE_GAPPS_PACKAGES += \
    Maps \
    pixel_experience_2019_midyear \
    pixel_experience_2019 \
    pixel_experience_2020_midyear \
    pixel_experience_2020 \
    pixel_experience_2021_midyear \
    pixel_experience_2021 \
    pixel_experience_2022_midyear \
    pixel_experience_2022

# Don't use google's NetworkStack
REMOVE_GAPPS_PACKAGES += \
    NetworkPermissionConfigGoogle \
    NetworkStackGoogle

$(call inherit-product, device/google/bonito/device-sargo.mk)
$(call inherit-product-if-exists, vendor/google_devices/bonito/proprietary/device-vendor.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \

# STOPSHIP deal with Qualcomm stuff later
# PRODUCT_RESTRICT_VENDOR_FILES := all

# b/189477034: Bypass build time check on uses_libs until vendor fixes all their apps
PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true

# Keep the VNDK APEX in /system partition for REL branches as these branches are
# expected to have stable API/ABI surfaces.
ifneq (REL,$(PLATFORM_VERSION_CODENAME))
  PRODUCT_PACKAGES += com.android.vndk.current.on_vendor
endif

PRODUCT_MANUFACTURER := Google
PRODUCT_BRAND := google
PRODUCT_NAME := pixeldust_sargo
PRODUCT_DEVICE := sargo
PRODUCT_MODEL := Pixel 3a

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.pixeldust.maintainer="PixelBoot"

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=sargo \
    PRIVATE_BUILD_DESC="sargo-user 12 SP2A.220505.008 8782922 release-keys"

BUILD_FINGERPRINT := google/sargo/sargo:12/SP2A.220505.008/8782922:user/release-keys

$(call inherit-product, vendor/google/sargo/sargo-vendor.mk)
