#
# Copyright (C) 2021 The PixelDust Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Bootanimation
BOOTANIMATION := 1080

# Release name
PRODUCT_RELEASE_NAME := Miatoll
export TARGET_DEVICE=miatoll

# Inherit from miatoll device
$(call inherit-product, device/xiaomi/miatoll/device.mk)

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# Google Apps
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)

# Device identifier
PRODUCT_NAME := pixeldust_miatoll
PRODUCT_DEVICE := miatoll
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Miatoll
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="SonalSingh18" \

# Remove bloat gapps
REMOVE_GAPPS_PACKAGES += \
    AppDirectedSMSService \
    AmbientSensePrebuilt \
    arcore \
    CbrsNetworkMonitor \
    DevicePolicyPrebuilt \
    DiagnosticsToolPrebuilt \
    DreamlinerPrebuilt \
    DreamlinerUpdater \
    GCS \
    GoogleCamera \
    GoogleTTS \
    MaestroPrebuilt \
    MarkupGoogle \
    MyVerizonServices \
    NgaResources \
    OBDM_Permissions \
    obdm_stub \
    OemDmTrigger \
    Ornament \
    ScribePrebuilt \
    Showcase \
    SoundPickerPrebuilt \
    SprintDM \
    SprintHM \
    StorageManagerGoogle \
    TagGoogle \
    talkback \
    Tycho \
    USCCDM \
    VzwOmaTrigger \
    VZWAPNLib \
    YouTube \
    YouTubeMusicPrebuilt
