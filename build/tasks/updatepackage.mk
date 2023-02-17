#
#    Copyright (C) 2023 The PixelDust Project
#    SPDX-License-Identifier: Apache-2.0
#

# PixelDust fastboot update package
PD_FASTBOOT_PACKAGE := $(PRODUCT_OUT)/$(PIXELDUST_VERSION)-img.zip

# Specify system colors
CL_PFX="\033[33m"
CL_INS="\033[36m"
CL_RED="\033[31m"
CL_GRN="\033[32m"
CL_YLW="\033[33m"
CL_BLU="\033[34m"
CL_MAG="\033[35m"
CL_CYN="\033[36m"
CL_RST="\033[0m"

.PHONY: updatepackage
updatepackage: $(INTERNAL_UPDATE_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_UPDATE_PACKAGE_TARGET) $(PD_FASTBOOT_PACKAGE)
	@echo ""
	@echo -e ${CL_GRN}"  ██▓███  ██▒██   ██▓█████ ██▓   ▓█████▄ █    ██  ██████▄▄▄█████▓"${CL_RST}
	@echo -e ${CL_GRN}" ▓██░  ██▓██▒▒ █ █ ▒▓█   ▀▓██▒   ▒██▀ ██▌██  ▓██▒██    ▒▓  ██▒ ▓▒"${CL_RST}
	@echo -e ${CL_GRN}" ▓██░ ██▓▒██░░  █   ▒███  ▒██░   ░██   █▓██  ▒██░ ▓██▄  ▒ ▓██░ ▒░"${CL_RST}
	@echo -e ${CL_GRN}" ▒██▄█▓▒ ░██░░ █ █ ▒▒▓█  ▄▒██░   ░▓█▄   ▓▓█  ░██░ ▒   ██░ ▓██▓ ░ "${CL_RST}
	@echo -e ${CL_GRN}" ▒██▒ ░  ░██▒██▒ ▒██░▒████░██████░▒████▓▒▒█████▓▒██████▒▒ ▒██▒ ░ "${CL_RST}
	@echo -e ${CL_GRN}" ▒▓▒░ ░  ░▓ ▒▒ ░ ░▓ ░░ ▒░ ░ ▒░▓  ░▒▒▓  ▒░▒▓▒ ▒ ▒▒ ▒▓▒ ▒ ░ ▒ ░░   "${CL_RST}
	@echo -e ${CL_GRN}" ░▒ ░     ▒ ░░   ░▒ ░░ ░  ░ ░ ▒  ░░ ▒  ▒░░▒░ ░ ░░ ░▒  ░ ░   ░    "${CL_RST}
	@echo -e ${CL_GRN}" ░░       ▒ ░░    ░    ░    ░ ░   ░ ░  ░ ░░░ ░ ░░  ░  ░   ░      "${CL_RST}
	@echo ""
	@echo -e ${CL_GRN}" Enjoy the PixelDust Goodness! "${CL_RST}
	@echo ""
	@echo -e ${CL_CYN}"════════════════════════════════════════════════════════════════════════════════"${CL_RST}
	@echo -e ${CL_CYN}"Package zip: "${CL_MAG} $(PIXELDUST_VERSION)-img.zip                             ${CL_RST}
	@echo -e ${CL_CYN}"Package size:"${CL_MAG}" `ls -l $(PD_FASTBOOT_PACKAGE) | cut -d ' ' -f 5`       "${CL_RST}
	@echo -e ${CL_CYN}"Timestamp:   "${CL_MAG} $(BUILD_TIMESTAMP)                                       ${CL_RST}
	@echo -e ${CL_CYN}"════════════════════════════════════════════════════════════════════════════════"${CL_RST}
