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

# Telephony packages
PRODUCT_PACKAGES += \
    Stk \
    CellBroadcastReceiver

# Extra Packages
PRODUCT_PACKAGES += \
    GoogleWallpaperPickerOverlay \
    Launcher3QuickStep \
    LiveWallpapers \
    LiveWallpapersPicker \
    PixeldustThemesStub \
    QuickAccessWallet \
    ThemePicker \

# Themes
-include vendor/themes/common.mk

# Include Potato volume panels
-include packages/apps/PotatoPlugins/plugins.mk

# Devices should opt-in to include PixelDustLauncher
ifneq ($(filter marlin sailfish blueline bonito bramble coral crosshatch miatoll redfin sunfish surya taimen,$(TARGET_DEVICE)),)
INCLUDE_PIXELDUSTLAUNCHER := true
endif

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
endif
