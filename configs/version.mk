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

#Pixel Dust ROM versioning
BUILD_VERSION := PixelDustROM-$(PLATFORM_VERSION)-$(shell date +%Y%m%d)

PRODUCT_BUILD_PROP_OVERRIDES := BUILD_DISPLAY_ID=$(BUILD_VERSION)
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_BUILD_TYPE=user
PD_BUILDTYPE := RELEASE

PIXELDUST_VERSION := pie-alpha-$(shell date +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.version=$(BUILD_VERSION)-$(PD_BUILDTYPE) \
    ro.pixeldust.ota.version=$(TARGET_PRODUCT)-$(PIXELDUST_VERSION)

