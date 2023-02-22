#
#    Copyright (C) 2023 The PixelDust Project
#    SPDX-License-Identifier: Apache-2.0
#

# Inherit from prebuilts
$(call inherit-product, vendor/pixeldust/prebuilt/bootanimation/bootanimation.mk)

# Properties
$(call inherit-product, vendor/pixeldust/configs/properties.mk)

# Inherit from configs
$(call inherit-product, vendor/pixeldust/configs/extra_permissions.mk)
$(call inherit-product, vendor/pixeldust/configs/packages.mk)
$(call inherit-product, vendor/pixeldust/configs/pixeldust_clo.mk)
$(call inherit-product, vendor/pixeldust/configs/pixel_sepolicy.mk)
$(call inherit-product, vendor/pixeldust/configs/rro_overlays.mk)
$(call inherit-product, vendor/pixeldust/configs/sounds.mk)
$(call inherit-product, vendor/pixeldust/configs/textclassifier.mk)
$(call inherit-product, vendor/pixeldust/configs/version.mk)

# Gapps
ifeq ($(WITH_GMS),true)
     $(call inherit-product, vendor/gms/products/gms.mk)
     $(call inherit-product-if-exists, vendor/partner_modules/build/mainline_modules.mk)
endif
