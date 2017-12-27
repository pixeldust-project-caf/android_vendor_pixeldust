include vendor/pixeldust/config/BoardConfigQcomDefs.mk

$(call add_json_map, Pixeldust)

$(call add_json_str_omitempty,  Additional_gralloc_10_usage_bits,       $(TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS))
$(call add_json_bool,           Should_skip_waiting_for_qsee,           $(filter true,$(TARGET_KEYMASTER_SKIP_WAITING_FOR_QSEE)))
$(call add_json_bool,           Supports_hw_fde,                        $(filter true,$(TARGET_HW_DISK_ENCRYPTION)))
$(call add_json_bool,           Supports_hw_fde_perf,                   $(filter true,$(TARGET_HW_DISK_ENCRYPTION_PERF)))
$(call add_json_str_omitempty,  Target_init_vendor_lib,                 $(TARGET_INIT_VENDOR_LIB))
$(call add_json_str_omitempty,  Target_process_sdk_version_override,    $(TARGET_PROCESS_SDK_VERSION_OVERRIDE))
$(call add_json_str,            Target_shim_libs,                       $(subst $(space),:,$(TARGET_LD_SHIM_LIBS)))
$(call add_json_bool,           Target_uses_color_metadata,             $(filter true,$(TARGET_USES_COLOR_METADATA)))
$(call add_json_bool,           Uses_qcom_um_family,                    $(filter true,$(TARGET_USES_QCOM_UM_FAMILY)))
$(call add_json_bool,           Uses_qcom_um_3_18_family,               $(filter true,$(TARGET_USES_QCOM_UM_3_18_FAMILY)))
$(call add_json_bool,           Uses_qcom_um_4_4_family,                $(filter true,$(TARGET_USES_QCOM_UM_4_4_FAMILY)))
$(call add_json_bool,           Uses_qcom_um_4_9_family,                $(filter true,$(TARGET_USES_QCOM_UM_4_9_FAMILY)))
$(call add_json_bool,           Uses_qcom_um_4_14_family,               $(filter true,$(TARGET_USES_QCOM_UM_4_14_FAMILY)))
$(call add_json_bool,           Uses_qti_camera_device,                 $(filter true,$(TARGET_USES_QTI_CAMERA_DEVICE)))
$(call add_json_bool,           Uses_qcom_bsp_legacy,                   $(filter true,$(TARGET_USES_QCOM_BSP_LEGACY)))

$(call end_json_map)
