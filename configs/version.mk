#
#    Copyright (C) 2023 The PixelDust Project
#    SPDX-License-Identifier: Apache-2.0
#

# Pixel Dust ROM versioning
PD_ROM_MAJ_VERSION := PixelDust-Universe
ANDROID_OS_VERSION := 14.0.0
BUILD_VERSION_CODE := clo

ifndef SIGN_KEY
  PD_BUILDTYPE := UNOFFICIAL
endif
BUILD_ID_LC := $(shell echo $(BUILD_ID) | tr '[:upper:]' '[:lower:]')
BUILD_TIMESTAMP := $(shell date -u +%s)

# Pixel Dust ROM package name 
PIXELDUST_VERSION := $(PD_ROM_MAJ_VERSION)-$(BUILD_VERSION_CODE)-$(TARGET_DEVICE)-$(TARGET_BUILD_VARIANT)-$(shell date +%Y%m%d-%H%M)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    com.pixeldust.fingerprint=$(PIXELDUST_VERSION) \
    ro.pixeldust.version=$(PD_ROM_MAJ_VERSION)-$(BUILD_VERSION_CODE)-$(TARGET_DEVICE)-$(PD_BUILDTYPE)
    ro.pixeldust.maintainer="nobody" \
    ro.pixeldust.device=$(TARGET_DEVICE) \
    ro.pixeldust.product.brand=$(PRODUCT_BRAND)

PRODUCT_PRODUCT_PROPERTIES += \
    ro.pixeldust.ota.version=$(ANDROID_OS_VERSION) \
    ro.pixeldust.ota.version_code=$(BUILD_VERSION_CODE) \
    ro.pixeldust.ota.timestamp=$(BUILD_TIMESTAMP)

PRODUCT_HOST_PACKAGES += \
    sign_target_files_apks \
    ota_from_target_files

# Include OTA configuration
include vendor/pixeldust/configs/pixeldust_ota.mk
