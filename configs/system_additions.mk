# Copyright (C) 2018-2020 The PixelDust Project
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

# Disable EAP Proxy because it depends on proprietary headers
# and breaks WPA Supplicant compilation.
DISABLE_EAP_PROXY := true

# Skip boot jars check
SKIP_BOOT_JARS_CHECK := true

# Extra Packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    Longshot \
    OPScreenRecorder \
    ThemePicker \
    OmniRecord \
    PixelDustThemeStub \
    DU-Themes

# Force Launcher3 (this is still needed to exclude the nexuslauncher overlays)
FORCE_BUILD_LAUNCHER3 := YES

# Ship lawnchair instead of launcher3 with unofficial builds 
ifndef PD_BUILDTYPE

PRODUCT_PACKAGES += \
    Lawnchair

PRODUCT_COPY_FILES += \
    vendor/pixeldust/config/permissions/privapp-permissions-lawnchair.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-lawnchair.xml \
    vendor/pixeldust/config/permissions/lawnchair-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/pixeldust/lawnchairoverlay/

else

PRODUCT_PACKAGES += \
    Launcher3QuickStep

endif

# Qualcomm privileged app permissions
PRODUCT_COPY_FILES += \
    vendor/pixeldust/config/permissions/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \

# Whitelist
PRODUCT_COPY_FILES += \
    vendor/pixeldust/config/permissions/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml

# Screenrecorder permissions
PRODUCT_COPY_FILES += \
    vendor/pixeldust/config/permissions/privapp-permissions-screenrecorder.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-screenrecorder.xml

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
    vendor/pixeldust/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/pixeldust/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/pixeldust/prebuilt/bin/50-base.sh:system/addon.d/50-base.sh
endif

# Cutout control overlays
PRODUCT_PACKAGES += \
    HideCutout \
    StatusBarStock

# Overlays
PRODUCT_PACKAGES += \
    NexusLauncherReleaseOverlay
