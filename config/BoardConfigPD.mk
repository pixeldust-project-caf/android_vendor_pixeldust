include vendor/pixeldust/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/pixeldust/config/BoardConfigQcom.mk
endif

include vendor/pixeldust/config/BoardConfigSoong.mk

PRODUCT_SOONG_NAMESPACES += $(PATHMAP_SOONG_NAMESPACES)
