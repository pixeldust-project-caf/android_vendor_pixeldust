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

# Themed bootanimation
TARGET_MISC_BLOCK_OFFSET ?= 0
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.misc.block.offset=$(TARGET_MISC_BLOCK_OFFSET)
PRODUCT_PACKAGES += \
    misc_writer_system \
    themed_bootanimation

ifneq ($(filter 1080,$(BOOTANIMATION)),)
    PRODUCT_COPY_FILES += \
        vendor/pixeldust/prebuilt/bootanimation/1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip \
        vendor/pixeldust/prebuilt/bootanimation/1080_black.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
endif

ifneq ($(filter 1440,$(BOOTANIMATION)),)
    PRODUCT_COPY_FILES += \
        vendor/pixeldust/prebuilt/bootanimation/1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip \
        vendor/pixeldust/prebuilt/bootanimation/1440_black.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
endif

ifneq ($(filter 1080_black,$(BOOTANIMATION)),)
    PRODUCT_COPY_FILES += \
        vendor/pixeldust/prebuilt/bootanimation/1080_black.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif

ifneq ($(filter 1440_black,$(BOOTANIMATION)),)
    PRODUCT_COPY_FILES += \
        vendor/pixeldust/prebuilt/bootanimation/1440_black.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif

