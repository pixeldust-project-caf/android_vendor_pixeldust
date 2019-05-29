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

# Use the default language for output
export LC_ALL=C

# Set default Java File Encoding to UTF-8
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/pixeldust/overlay/common

# Include PixelDust device specific sepolicies
include device/pixeldust/sepolicy/common/sepolicy.mk

# Include needed privapp permissions whitelist
PRODUCT_COPY_FILES += vendor/pixeldust/prebuilt/etc/privapp-permissions/pixeldust-permissions.xml:system/etc/sysconfig/pixeldust-permissions.xml

# Copy all init rc files
$(foreach f,$(wildcard vendor/pixeldust/prebuilt/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))

# Disable qmi EAP-SIM security
DISABLE_EAP_PROXY := true
