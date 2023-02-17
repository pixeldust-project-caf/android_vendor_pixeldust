#
#    Copyright (C) 2023 The PixelDust Project
#    SPDX-License-Identifier: Apache-2.0
#

SIGNED_TARGET_FILES_PACKAGE := $(PRODUCT_OUT)/$(TARGET_DEVICE)-target_files-$(BUILD_ID_LC).zip
SIGN_FROM_TARGET_FILES := $(HOST_OUT_EXECUTABLES)/sign_target_files_apks$(HOST_EXECUTABLE_SUFFIX)

$(SIGNED_TARGET_FILES_PACKAGE): $(BUILT_TARGET_FILES_PACKAGE) \
		build/tools/releasetools/sign_target_files_apks
	@echo "Signed target files package: $@"
	    $(SIGN_FROM_TARGET_FILES) --verbose \
	    -o \
	    -p $(OUT_DIR)/host/linux-x86 \
	    -d $(PROD_CERTS) \
	    $(BUILT_TARGET_FILES_PACKAGE) $@

.PHONY: signed-target-files-package
signed-target-files-package: $(SIGNED_TARGET_FILES_PACKAGE)

PD_TARGET_PACKAGE := $(PRODUCT_OUT)/$(PIXELDUST_VERSION).zip

$(PD_TARGET_PACKAGE): KEY_CERT_PAIR := $(PROD_CERTS)/releasekey

$(PD_TARGET_PACKAGE): $(BRO)

$(PD_TARGET_PACKAGE): $(SIGNED_TARGET_FILES_PACKAGE) \
		build/tools/releasetools/ota_from_target_files
	@echo "pixeldust production: $@"
	    $(OTA_FROM_TARGET_FILES) --verbose \
	    --block \
	    -p $(OUT_DIR)/host/linux-x86 \
	    -k $(KEY_CERT_PAIR) \
	    $(SIGNED_TARGET_FILES_PACKAGE) $@

MD5 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/md5sum

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

.PHONY: pixeldust
pixeldust: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(PD_TARGET_PACKAGE)
	$(hide) $(MD5) $(PD_TARGET_PACKAGE) > $(PD_TARGET_PACKAGE).md5sum
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
	@echo -e ${CL_CYN}"Package zip: "${CL_MAG} $(PIXELDUST_VERSION).zip                                 ${CL_RST}
	@echo -e ${CL_CYN}"Package md5: "${CL_MAG}" `cat $(PD_TARGET_PACKAGE).md5sum | cut -d ' ' -f 1`    "${CL_RST}
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
	    $(OTA_FROM_TARGET_FILES) --verbose \
	    --block \
	    -p $(OUT_DIR)/host/linux-x86 \
	    -k $(KEY_CERT_PAIR) \
	    -i $(PREVIOUS_TARGET_FILES_PACKAGE) \
	    $(SIGNED_TARGET_FILES_PACKAGE) $@

.PHONY: incremental-ota
incremental-ota: $(INCREMENTAL_OTA_PACKAGE_TARGET)

endif
