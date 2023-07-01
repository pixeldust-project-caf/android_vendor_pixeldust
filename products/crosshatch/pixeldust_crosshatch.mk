#
# Copyright (C) 2019-2021 The PixelDust Project
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

#
# All components inherited here go to vendor image
#
# TODO(b/136525499): move *_vendor.mk into the vendor makefile later
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_vendor.mk)

# Release name
export TARGET_DEVICE=crosshatch

# Bootanimation
BOOTANIMATION := 1440

# Enable legacy IMS patch
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.telephony.block_binder_thread_on_incoming_calls=false

# Force apex to build from AOSP sources
MODULE_BUILD_FROM_SOURCE := true

# Overlay packages for APK-type modules
PRODUCT_PACKAGES += \
    GoogleDocumentsUIOverlay \
    ModuleMetadataGoogleOverlay \
    GooglePermissionControllerOverlay \
    GooglePermissionControllerFrameworkOverlay \
    GoogleExtServicesConfigOverlay \
    CaptivePortalLoginFrameworkOverlay

# Mainline modules - APK type
PRODUCT_PACKAGES += \
    com.google.android.modulemetadata \
    DocumentsUIGoogle \
    CaptivePortalLoginGoogle

# GoogleExtServicesConfig
PRODUCT_PACKAGES += \
    com.google.android.extservices

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/apex/com.google.android.extservices.apex

# Google Apps
WITH_GMS := true
DEVICE_REQUIRES_CARRIER_APPS := true
REMOVE_GAPPS_PACKAGES += \
    DocumentsUIGoogle \
    GoogleCamera \
    GoogleTTS \
    Maps \
    StorageManagerGoogle \
    talkback

# ElmyraService
PRODUCT_PACKAGES += \
    ElmyraService

# Product properties
PRODUCT_NAME := pixeldust_crosshatch
PRODUCT_DEVICE := crosshatch
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 3 XL
PRODUCT_MANUFACTURER := Google

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.pixeldust.maintainer="spezi77"

# Inherit AOSP stuff
$(call inherit-product, vendor/pixeldust/configs/telephony.mk)
$(call inherit-product, device/google/crosshatch/device-crosshatch.mk)

PRODUCT_COPY_FILES += device/google/crosshatch/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

# b/189477034: Bypass build time check on uses_libs until vendor fixes all their apps
PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true

$(call inherit-product, vendor/google/crosshatch/crosshatch-vendor.mk)
