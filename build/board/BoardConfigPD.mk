#
#    Copyright (C) 2023 The PixelDust Project
#    SPDX-License-Identifier: Apache-2.0
#

# Kernel
ifneq ($(TARGET_NO_KERNEL),true)
include vendor/pixeldust/build/board/BoardConfigKernel.mk
endif

# Soong
include vendor/pixeldust/build/board/BoardConfigSoong.mk
