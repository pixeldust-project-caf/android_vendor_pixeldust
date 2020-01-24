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

# curl
PRODUCT_PACKAGES += \
    curl

# Telephony packages
PRODUCT_PACKAGES += \
    Stk \
    CellBroadcastReceiver

# ModuleMetadata
PRODUCT_PACKAGES += \
    ModuleMetadataGoogle

# Extra Packages
PRODUCT_PACKAGES += \
    GoogleWallpaperPickerOverlay \
    Launcher3QuickStep \
    LiveWallpapers \
    LiveWallpapersPicker \
    PixeldustThemesStub \
    PixelDustWallpapers \
    QuickAccessWallet \
    PixeldustThemePicker \

# Repainter integration
PRODUCT_PACKAGES += \
    RepainterServicePriv \

# Charger mode images
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# Pixel Style
-include vendor/pixelstyle/config.mk

# Themes
-include vendor/themes/common.mk

# Include Potato volume panels
-include packages/apps/PotatoPlugins/plugins.mk

# Lawnicons
-include vendor/lawnicons/overlay.mk

# Lawnchair
ifeq ($(WITH_LAWNCHAIR),true)
REMOVE_GAPPS_PACKAGES += \
    NexusLauncherRelease
$(call inherit-product-if-exists, vendor/lawnchair/lawnchair.mk)
endif

# Devices should opt-in to include PixelDustLauncher
#ifneq ($(filter marlin sailfish blueline bonito bramble coral crosshatch miatoll redfin sunfish surya taimen,$(TARGET_DEVICE)),)
#INCLUDE_PIXELDUSTLAUNCHER := true
#endif

ifeq ($(INCLUDE_PIXELDUSTLAUNCHER), true)
REMOVE_GAPPS_PACKAGES += \
    NexusLauncherRelease
else
INCLUDE_PIXELLAUNCHER := true
endif

# Pixel specific
ifneq ($(filter blueline bonito bramble coral crosshatch redfin sunfish taimen,$(TARGET_DEVICE)),)
PRODUCT_PACKAGES += \
    ElmyraService

# Copy quick tap enable sysconfig
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/etc/sysconfig/quick_tap.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/quick_tap.xml
endif

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
