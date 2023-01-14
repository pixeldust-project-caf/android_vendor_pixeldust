#
# Copyright (C) 2021-2023 The PixelDust Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
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
