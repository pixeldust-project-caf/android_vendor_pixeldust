#
#    Copyright (C) 2023 The PixelDust Project
#    SPDX-License-Identifier: Apache-2.0
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

# Neural Network
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-rtti

# Telephony packages
PRODUCT_PACKAGES += \
    Stk \
    CellBroadcastReceiver

# Extra Packages
PRODUCT_PACKAGES += \
    Launcher3QuickStep \
    LiveWallpapers \
    LiveWallpapersPicker \
    PixeldustLauncher \
    PixelDustWallpapers \
    QuickAccessWallet \

# Charger mode images
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# Pixel Style
-include vendor/pixelstyle/config.mk

# Themes
-include vendor/themes/common.mk

# SystemUI Clocks
-include vendor/SystemUIClocks/product.mk

# Repainter integration
PRODUCT_PACKAGES += \
    RepainterServicePriv

# SystemUIFlagFlipper
PRODUCT_PACKAGES += \
    SystemUIFlagFlipper

# StatixThemePicker
PRODUCT_PACKAGES += \
    StatixThemePicker
