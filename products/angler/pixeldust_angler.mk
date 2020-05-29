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
BOOTANIMATION := 1440

# Release name
PRODUCT_RELEASE_NAME := Nexus 6P
export TARGET_DEVICE := angler

# Inherit AOSP device configuration for angler.
$(call inherit-product, device/huawei/angler/aosp_angler.mk)

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# Google Apps
$(call inherit-product-if-exists, vendor/gapps/gapps.mk)
REMOVE_GAPPS_PACKAGES += \
    GoogleCamera \
    PrebuiltGmail \
    NexusLauncherRelease

# MSM8994 Display HAL settings
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=c2d \
    debug.sf.hw=1 \
    persist.debug.wfd.enable=1 \
    persist.demo.hdmirotationlock=false \
    persist.hwc.enable_vds=1 \
    persist.hwc.mdpcomp.enable=true \
    persist.hwc.ptor.enable=true \
    persist.mdpcomp.4k2kSplit=1 \
    persist.hwc.mdpcomp.maxpermixer=5 \
    persist.mdpcomp_perfhint=50 \
    persist.metadata_dynfps.disable=true \
    persist.sys.wfd.virtual=0

PRODUCT_PACKAGES += \
    copybit.msm8994

# Exclude QCOM SEPolicy
TARGET_EXCLUDE_QCOM_SEPOLICY := true

# Generic CAF packages
$(call inherit-product, device/qcom/common/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := pixeldust_angler
PRODUCT_BRAND := google
PRODUCT_DEVICE := angler
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := Huawei

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=angler \
    PRIVATE_BUILD_DESC="angler-user 8.1.0 OPM3.171019.014 4503998 release-keys"

BUILD_FINGERPRINT := google/angler/angler:8.1.0/OPM3.171019.014/4503998:user/release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=google/angler/angler:8.1.0/OPM3.171019.014/4503998:user/release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="PixelBoot" \
    ro.pixeldust.device="angler"
