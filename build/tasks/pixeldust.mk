#
# Copyright (C) 2018-2019 The Pixel3ROM Project
# Copyright (C) 2020 The PixelDust Project
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

SIGNED_TARGET_FILES_PACKAGE := $(PRODUCT_OUT)/$(TARGET_DEVICE)-target_files-$(BUILD_ID_LC).zip

$(SIGNED_TARGET_FILES_PACKAGE): $(BUILT_TARGET_FILES_PACKAGE) \
		build/tools/releasetools/sign_target_files_apks
	@echo "Signed target files package: $@"
	    ./build/tools/releasetools/sign_target_files_apks --verbose \
	    -o \
	    -p $(OUT_DIR)/host/linux-x86 \
	    -d $(PROD_CERTS) \
	    $(SIGNING_FLAGS) \
	    $(APEX_SIGNING_FLAGS) \
	    $(BUILT_TARGET_FILES_PACKAGE) $@

.PHONY: signed-target-files-package
signed-target-files-package: $(SIGNED_TARGET_FILES_PACKAGE)

PD_TARGET_PACKAGE := $(PRODUCT_OUT)/$(PIXELDUST_VERSION).zip

$(PD_TARGET_PACKAGE): KEY_CERT_PAIR := $(PROD_CERTS)/releasekey

$(PD_TARGET_PACKAGE): $(BRO)

$(PD_TARGET_PACKAGE): $(SIGNED_TARGET_FILES_PACKAGE) \
		build/tools/releasetools/ota_from_target_files
	@echo "pixeldust production: $@"
	    ./build/tools/releasetools/ota_from_target_files --verbose \
	    --block \
	    -p $(OUT_DIR)/host/linux-x86 \
	    -k $(KEY_CERT_PAIR) \
	    $(SIGNED_TARGET_FILES_PACKAGE) $@

.PHONY: pixeldust
pixeldust: $(PD_TARGET_PACKAGE)
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
	@echo -e ${CL_GRN}" Build completed successfully. "${CL_RST}
	@echo ""
	@echo -e ${CL_GRN}" 〉Enjoy the PixelDust Goodness! // "${CL_RST}
	@echo ""
	@echo -e ${CL_CYN}"════════════════════════════════════════════════════════════════════════════════"${CL_RST}
	@echo -e ${CL_CYN}"Package zip: "${CL_MAG} $(PIXELDUST_VERSION).zip                                 ${CL_RST}
	@echo -e ${CL_CYN}"Package size:"${CL_MAG}" `ls -l $(PD_TARGET_PACKAGE) | cut -d ' ' -f 5`         "${CL_RST}
	@echo -e ${CL_CYN}"Timestamp:   "${CL_MAG} $(BUILD_TIMESTAMP)                                       ${CL_RST}
	@echo -e ${CL_CYN}"════════════════════════════════════════════════════════════════════════════════"${CL_RST}

ifneq ($(PREVIOUS_TARGET_FILES_PACKAGE),)

INCREMENTAL_OTA_PACKAGE_TARGET := $(PRODUCT_OUT)/incremental-$(PIXELDUST_VERSION).zip

$(INCREMENTAL_OTA_PACKAGE_TARGET): KEY_CERT_PAIR := $(PROD_CERTS)/releasekey

$(INCREMENTAL_OTA_PACKAGE_TARGET): $(BRO)

$(INCREMENTAL_OTA_PACKAGE_TARGET): $(SIGNED_TARGET_FILES_PACKAGE) \
		build/tools/releasetools/ota_from_target_files
	@echo "pixeldust incremental production: $@"
	    ./build/tools/releasetools/ota_from_target_files --verbose \
	    --block \
	    -p $(OUT_DIR)/host/linux-x86 \
	    -k $(KEY_CERT_PAIR) \
	    -i $(PREVIOUS_TARGET_FILES_PACKAGE) \
	    $(SIGNED_TARGET_FILES_PACKAGE) $@

.PHONY: incremental-ota
incremental-ota: $(INCREMENTAL_OTA_PACKAGE_TARGET)

endif
