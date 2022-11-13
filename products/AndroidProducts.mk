# Copyright (C) 2019-2022 The PixelDust Project
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
    $(LOCAL_DIR)/bonito/pixeldust_bonito.mk \
    $(LOCAL_DIR)/cheetah/pixeldust_cheetah.mk \
    $(LOCAL_DIR)/coral/pixeldust_coral.mk \
    $(LOCAL_DIR)/crosshatch/pixeldust_crosshatch.mk \
    $(LOCAL_DIR)/flame/pixeldust_flame.mk \
    $(LOCAL_DIR)/miatoll/pixeldust_miatoll.mk \
    $(LOCAL_DIR)/oriole/pixeldust_oriole.mk \
    $(LOCAL_DIR)/panther/pixeldust_panther.mk \
    $(LOCAL_DIR)/raven/pixeldust_raven.mk \
    $(LOCAL_DIR)/redfin/pixeldust_redfin.mk \
    $(LOCAL_DIR)/sargo/pixeldust_sargo.mk \
    $(LOCAL_DIR)/taimen/pixeldust_taimen.mk \
    $(LOCAL_DIR)/tissot/pixeldust_tissot.mk \
    $(LOCAL_DIR)/surya/pixeldust_surya.mk \
    $(LOCAL_DIR)/walleye/pixeldust_walleye.mk \
    $(LOCAL_DIR)/X01BD/pixeldust_X01BD.mk \
    $(LOCAL_DIR)/X00T/pixeldust_X00T.mk

# Lunch targets
COMMON_LUNCH_CHOICES += \
    pixeldust_blueline-userdebug \
    pixeldust_blueline-user \
    pixeldust_blueline-eng \
    pixeldust_bonito-userdebug \
    pixeldust_bonito-user \
    pixeldust_bonito-eng \
    pixeldust_coral-userdebug \
    pixeldust_coral-user \
    pixeldust_cheetah-userdebug \
    pixeldust_cheetah-user \
    pixeldust_cheetah-eng \
    pixeldust_crosshatch-userdebug \
    pixeldust_crosshatch-user \
    pixeldust_crosshatch-eng \
    pixeldust_flame-userdebug \
    pixeldust_flame-user \
    pixeldust_miatoll-eng \
    pixeldust_miatoll-user \
    pixeldust_miatoll-userdebug \
    pixeldust_oriole-userdebug \
    pixeldust_oriole-user \
    pixeldust_oriole-eng \
    pixeldust_panther-userdebug \
    pixeldust_panther-user \
    pixeldust_panther-eng \
    pixeldust_raven-userdebug \
    pixeldust_raven-user \
    pixeldust_raven-eng \
    pixeldust_redfin-userdebug \
    pixeldust_redfin-user \
    pixeldust_redfin-eng \
    pixeldust_sargo-userdebug \
    pixeldust_sargo-user \
    pixeldust_sargo-eng \
    pixeldust_taimen-userdebug \
    pixeldust_taimen-user \
    pixeldust_tissot-userdebug \
    pixeldust_tissot-user \
    pixeldust_surya-userdebug \
    pixeldust_surya-user \
    pixeldust_surya-eng \
    pixeldust_walleye-userdebug \
    pixeldust_walleye-user \
    pixeldust_X01BD-userdebug \
    pixeldust_X01BD-user \
    pixeldust_X00T-userdebug \
    pixeldust_X00T-user
