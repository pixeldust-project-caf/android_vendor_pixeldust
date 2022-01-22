#
# Copyright (C) 2018-2021 The PixelDust Project
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

# Pixel Dust ROM versioning
PD_ROM_MAJ_VERSION := PixelDust-SaltedCaramel
ANDROID_OS_VERSION := 12.0.0
BUILD_VERSION_CODE := caf

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
    ro.pixeldust.device=$(TARGET_DEVICE)

PRODUCT_PRODUCT_PROPERTIES += \
    ro.pixeldust.ota.version=$(ANDROID_OS_VERSION) \
    ro.pixeldust.ota.version_code=$(BUILD_VERSION_CODE) \
    ro.pixeldust.ota.timestamp=$(BUILD_TIMESTAMP)

# Override fingerprint for Google Play Services and SafetyNet
ifneq ($(PRODUCT_OVERRIDE_FINGERPRINT),)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.build.stock_fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT)
endif

PRODUCT_HOST_PACKAGES += \
    sign_target_files_apks \
    ota_from_target_files

# Include OTA configuration
include vendor/pixeldust/configs/pixeldust_ota.mk
