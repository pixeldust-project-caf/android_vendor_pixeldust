#
#    Copyright (C) 2023 The PixelDust Project
#    SPDX-License-Identifier: Apache-2.0
#

ifeq ($(SIGN_KEY), RELEASE)

# We modify several neverallows, so let the build proceed
SELINUX_IGNORE_NEVERALLOWS := true
SELINUX_IGNORE_NEVERALLOWS_ON_USER := true

PRODUCT_PRODUCT_PROPERTIES += \
    ro.pixeldust.ota.build_type=$(SIGN_KEY)

PRODUCT_PACKAGES += \
    Updates

PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/etc/init/init.pixeldust-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.pixeldust-updater.rc
endif
