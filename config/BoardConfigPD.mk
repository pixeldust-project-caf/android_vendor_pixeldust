# Kernel
include vendor/pixeldust/config/BoardConfigKernel.mk

# Soong
include vendor/pixeldust/config/BoardConfigSoong.mk

# QCOM
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/pixeldust/config/BoardConfigQcom.mk
endif

