# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
# Copyright (C) 2019 The PixelDust Project
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


PD_TARGET_PACKAGE := $(PRODUCT_OUT)/$(PIXELDUST_VERSION).zip

.PHONY: pixeldust
pixeldust: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(PD_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(PD_TARGET_PACKAGE) > $(PD_TARGET_PACKAGE).md5sum
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
	@echo -e ${CL_RED}" Build completed successfully. "${CL_RST}
	@echo ""
	@echo -e ${CL_RED}" 〉Enjoy the PixelDust Goodness! // "${CL_RST}
	@echo ""
	@echo -e ${CL_CYN}"════════════════════════════════════════════════════════════════════════════════"${CL_RST}
	@echo -e ${CL_CYN}"Package zip: "${CL_MAG} $(PIXELDUST_VERSION).zip                                 ${CL_RST}
	@echo -e ${CL_CYN}"Package md5: "${CL_MAG}" `cat $(PD_TARGET_PACKAGE).md5sum | cut -d ' ' -f 1`    "${CL_RST}
	@echo -e ${CL_CYN}"Package size:"${CL_MAG}" `ls -l $(PD_TARGET_PACKAGE) | cut -d ' ' -f 5`         "${CL_RST}
	@echo -e ${CL_CYN}"Timestamp:   "${CL_MAG} $(BUILD_TIMESTAMP)                                       ${CL_RST}
	@echo -e ${CL_CYN}"════════════════════════════════════════════════════════════════════════════════"${CL_RST}
