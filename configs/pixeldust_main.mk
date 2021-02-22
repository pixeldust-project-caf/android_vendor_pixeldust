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

# Include overlays
DEVICE_PACKAGE_OVERLAYS += \
    vendor/pixeldust/overlay

# Inherit from rro_overlays config
$(call inherit-product, vendor/pixeldust/configs/rro_overlays.mk)

# Include needed privapp permissions whitelist
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/etc/privapp-permissions/pixeldust-permissions.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/pixeldust-permissions.xml \
    vendor/pixeldust/prebuilt/etc/privapp-permissions/pixeldust-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/pixeldust-permissions.xml

# Copy all init rc files
$(foreach f,$(wildcard vendor/pixeldust/prebuilt/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))
