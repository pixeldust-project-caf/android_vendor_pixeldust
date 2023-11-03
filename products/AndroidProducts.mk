#
#    Copyright (C) 2023 The PixelDust Project
#    SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES += \
    $(LOCAL_DIR)/blueline/pixeldust_blueline.mk \
    $(LOCAL_DIR)/bonito/pixeldust_bonito.mk \
    $(LOCAL_DIR)/cheetah/pixeldust_cheetah.mk \
    $(LOCAL_DIR)/crosshatch/pixeldust_crosshatch.mk \
    $(LOCAL_DIR)/felix/pixeldust_felix.mk \
    $(LOCAL_DIR)/husky/pixeldust_husky.mk \
    $(LOCAL_DIR)/lynx/pixeldust_lynx.mk \
    $(LOCAL_DIR)/oriole/pixeldust_oriole.mk \
    $(LOCAL_DIR)/panther/pixeldust_panther.mk \
    $(LOCAL_DIR)/raven/pixeldust_raven.mk \
    $(LOCAL_DIR)/sargo/pixeldust_sargo.mk \
    $(LOCAL_DIR)/taimen/pixeldust_taimen.mk \
    $(LOCAL_DIR)/walleye/pixeldust_walleye.mk

# Lunch targets
COMMON_LUNCH_CHOICES += \
    pixeldust_blueline-userdebug \
    pixeldust_blueline-user \
    pixeldust_blueline-eng \
    pixeldust_bonito-userdebug \
    pixeldust_bonito-user \
    pixeldust_bonito-eng \
    pixeldust_cheetah-userdebug \
    pixeldust_cheetah-user \
    pixeldust_cheetah-eng \
    pixeldust_crosshatch-userdebug \
    pixeldust_crosshatch-user \
    pixeldust_crosshatch-eng \
    pixeldust_felix-userdebug \
    pixeldust_felix-user \
    pixeldust_felix-eng \
    pixeldust_husky-userdebug \
    pixeldust_husky-user \
    pixeldust_husky-eng \
    pixeldust_lynx-userdebug \
    pixeldust_lynx-user \
    pixeldust_lynx-eng \
    pixeldust_oriole-userdebug \
    pixeldust_oriole-user \
    pixeldust_oriole-eng \
    pixeldust_panther-userdebug \
    pixeldust_panther-user \
    pixeldust_panther-eng \
    pixeldust_raven-userdebug \
    pixeldust_raven-user \
    pixeldust_raven-eng \
    pixeldust_sargo-userdebug \
    pixeldust_sargo-user \
    pixeldust_sargo-eng \
    pixeldust_taimen-userdebug \
    pixeldust_taimen-user \
    pixeldust_taimen-eng \
    pixeldust_walleye-userdebug \
    pixeldust_walleye-user \
    pixeldust_walleye-eng
