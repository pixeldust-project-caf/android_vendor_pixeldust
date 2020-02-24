# Copyright (C) 2018-2019 The PixelDust Project
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

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += libprotobuf-cpp-full

# Include support for additional filesystems
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# TCP Connection Management
PRODUCT_PACKAGES += tcmiface
#PRODUCT_BOOT_JARS += tcmiface

# RCS Service
PRODUCT_PACKAGES += \
    rcscommon \
    rcscommon.xml \
    rcsservice \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_aidl_static \
    rcs_service_api \
    rcs_service_api.xml

# Bluetooth Audio (A2DP)
PRODUCT_PACKAGES += libbthost_if

# MSIM manual provisioning
PRODUCT_PACKAGES += ims-ext-common
PRODUCT_PACKAGES += telephony-ext
#PRODUCT_BOOT_JARS += telephony-ext

# Themes
-include vendor/themes/common.mk

# Extra Packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    Longshot \
    ThemePicker \
    OmniRecord \
    PixelDustThemeStub \
    DU-Themes

# Force Launcher3 (this is still needed to include the appropriate overlays)
FORCE_BUILD_LAUNCHER3 := YES

PRODUCT_PACKAGES += \
    Launcher3QuickStep

# Hidden API whitelist
PRODUCT_COPY_FILES += \
    vendor/pixeldust/config/permissions/pdx-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/pdx-hiddenapi-package-whitelist.xml

# Backup Tool
ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/pixeldust/prebuilt/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/pixeldust/prebuilt/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
else
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/bin/backuptool.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool.sh \
    vendor/pixeldust/prebuilt/bin/backuptool.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool.functions \
    vendor/pixeldust/prebuilt/bin/50-base.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-base.sh
endif

# Cutout control overlays
PRODUCT_PACKAGES += \
    HideCutout \
    StatusBarStock

# Overlays
PRODUCT_PACKAGES += \
    NexusLauncherReleaseOverlay
