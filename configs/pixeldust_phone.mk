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

include vendor/pixeldust/configs/aosp_fixes.mk
include vendor/pixeldust/configs/bootanimation.mk
include vendor/pixeldust/configs/fonts.mk
include vendor/pixeldust/configs/pixeldust_main.mk
include vendor/pixeldust/configs/pixeldust_optimizations.mk
include vendor/pixeldust/configs/system_additions.mk
include vendor/pixeldust/configs/version.mk
include vendor/pixeldust/configs/ota.mk

# Telephony packages
PRODUCT_PACKAGES += \
    Stk \
    CellBroadcastReceiver

# Enable tethering
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.dun.override=0

# Copy APN list
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/etc/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml
