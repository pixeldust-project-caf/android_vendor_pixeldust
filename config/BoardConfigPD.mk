# Qcom
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/pixeldust/config/BoardConfigQcom.mk
endif

# Soong
include vendor/pixeldust/config/BoardConfigSoong.mk
