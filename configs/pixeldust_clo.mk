#
#    Copyright (C) 2023 The PixelDust Project
#    SPDX-License-Identifier: Apache-2.0
#

# Disable EAP Proxy because it depends on proprietary headers and breaks WPA Supplicant compilation.
DISABLE_EAP_PROXY := true

# Move Wi-Fi modules to vendor.
PRODUCT_VENDOR_MOVE_ENABLED := true

# Skip boot jars check
SKIP_BOOT_JARS_CHECK := true

# Include definitions for Snapdragon Clang
$(call inherit-product, vendor/qcom/sdclang/config/SnapdragonClang.mk)

# QTI VNDK Framework Detect
PRODUCT_PACKAGES += \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti.vendor

# Telephony - AOSP
PRODUCT_PACKAGES += \
    Stk

# Packages
PRODUCT_PACKAGES += \
    extphonelib \
    extphonelib-product \
    extphonelib.xml \
    extphonelib_product.xml \
    ims-ext-common \
    ims_ext_common.xml \
    telephony-ext \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml

PRODUCT_BOOT_JARS += \
    telephony-ext

# Enable CLO silky scroll and boost gesture flings
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.vendor.perf.ss=true \
    vendor.perf.gestureflingboost.enable=true \
    sys.use_fifo_ui=1
