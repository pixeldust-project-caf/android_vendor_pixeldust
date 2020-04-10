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

# Turn off the error checks and allow PATH tool to be used
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true

# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0

# Don't build debug for host or device
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
ART_BUILD_TARGET_NDEBUG := true
ART_BUILD_TARGET_DEBUG := false
ART_BUILD_HOST_NDEBUG := true
ART_BUILD_HOST_DEBUG := false

# Dex pre-opt
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false

# Recommend using the non debug dexpreopter
USE_DEX2OAT_DEBUG := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# Dex preopt
ifneq ($(filter blueline bonito coral crosshatch flame sargo taimen walleye,$(TARGET_DEVICE)),)
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUIGoogle
else
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI
endif

