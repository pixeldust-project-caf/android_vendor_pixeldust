#
# Copyright (C) 2019-2022 The PixelDust Project
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
