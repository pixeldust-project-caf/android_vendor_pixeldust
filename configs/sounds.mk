#
#    Copyright (C) 2023 The PixelDust Project
#    SPDX-License-Identifier: Apache-2.0
#

# Pixel Sounds - redfin-user 11 RQ3A.210705.001 7380771 release-keys
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/pixeldust/prebuilt/pixelsounds/,$(TARGET_COPY_OUT_PRODUCT)/media/audio)

# 2019 Material product sounds (CC-BY 4.0)
# Source: https://material.io/design/sound/sound-resources.html
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/pixeldust/prebuilt/materialsounds/,$(TARGET_COPY_OUT_PRODUCT)/media/audio)

