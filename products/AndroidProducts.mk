# Copyright (C) 2019 The PixelDust Project
#
# Licensed under the Apurityche License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apurityche.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PRODUCT_MAKEFILES += \
    $(LOCAL_DIR)/blueline/pixeldust_blueline.mk \
    $(LOCAL_DIR)/marlin/pixeldust_marlin.mk \
    $(LOCAL_DIR)/taimen/pixeldust_taimen.mk \
    $(LOCAL_DIR)/tissot/pixeldust_tissot.mk \
    $(LOCAL_DIR)/sailfish/pixeldust_sailfish.mk \
    $(LOCAL_DIR)/X01BD/pixeldust_X01BD.mk \
    $(LOCAL_DIR)/X00T/pixeldust_X00T.mk

# Lunch targets
COMMON_LUNCH_CHOICES += \
    pixeldust_blueline-userdebug \
    pixeldust_blueline-user \
    pixeldust_marlin-userdebug \
    pixeldust_marlin-user \
    pixeldust_taimen-userdebug \
    pixeldust_taimen-user \
    pixeldust_tissot-userdebug \
    pixeldust_tissot-user \
    pixeldust_sailfish-userdebug \
    pixeldust_sailfish-user \
    pixeldust_X01BD-userdebug \
    pixeldust_X01BD-user \
    pixeldust_X00T-userdebug \
    pixeldust_X00T-user
