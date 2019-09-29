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

# Proprietary latinime libs needed for Keyboard swyping
ifeq ($(TARGET_ARCH), $(filter $(TARGET_ARCH), arm64))
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so \
    vendor/pixeldust/prebuilt/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so
else
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    vendor/pixeldust/prebuilt/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
endif

# Google property overides
ifeq ($(filter marlin sailfish,$(TARGET_PRODUCT)),)
PRODUCT_PRODUCT_PROPERTIES += \
    keyguard.no_require_sim=true \
    ro.com.android.dataroaming=false
endif

PRODUCT_PRODUCT_PROPERTIES += \
    ro.carrier=unknown \
    ro.opa.eligible_device=true

