#
#    Copyright (C) 2023 The PixelDust Project
#    SPDX-License-Identifier: Apache-2.0
#

# World APNs list and Sensitive phone numbers
PRODUCT_PACKAGES += \
    apns-conf.xml \
    sensitive_pn.xml

# Inherit from pixeldust_phone
$(call inherit-product, vendor/pixeldust/configs/pixeldust_phone.mk)
