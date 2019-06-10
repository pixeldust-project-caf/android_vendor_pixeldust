# Copyright (C) 2018 The Pixel Dust Project
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

scr_resolution := 1080

# Add Pixel Dust ROM bootanimation based on device
ifneq ($(filter pixeldust_crosshatch pixeldust_taimen pixeldust_tissot pixeldust_X01BD,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/pixeldust/prebuilt/bootanimation/1440.zip:system/media/bootanimation.zip
endif

ifneq ($(wildcard vendor/pixeldust/prebuilt/bootanimation/$(scr_resolution).zip),)
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/bootanimation/$(scr_resolution).zip:system/media/bootanimation.zip
endif

