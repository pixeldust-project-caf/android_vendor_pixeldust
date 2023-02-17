#
#    Copyright (C) 2023 The PixelDust Project
#    SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Inherit pixeldust product configs.
$(call inherit-product, vendor/pixeldust/configs/telephony.mk)

# Includes all AOSP product packages
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_product.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_product.mk)

# Additional settings used in all AOSP builds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.android.dataroaming?=false \
    ro.carrier=unknown \
    keyguard.no_require_sim=true \
    net.tethering.noprovisioning=true

# More AOSP packages
PRODUCT_PACKAGES += \
    messaging \
    PhotoTable \
    preinstalled-packages-platform-aosp-product.xml \
    WallpaperPicker \

# Enforce RRO targets
PRODUCT_ENFORCE_RRO_TARGETS := *

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Enable whole-program R8 Java optimizations for SystemUI and system_server,
# but also allow explicit overriding for testing and development.
SYSTEM_OPTIMIZE_JAVA ?= true
SYSTEMUI_OPTIMIZE_JAVA ?= true
