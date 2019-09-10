$(call add_json_map, Pixeldust)

$(call add_json_str_omitempty,	Target_init_vendor_lib,					$(TARGET_INIT_VENDOR_LIB))
$(call add_json_str,		Target_shim_libs, 					$(subst $(space),:,$(TARGET_LD_SHIM_LIBS)))
$(call add_json_bool,		Target_uses_color_metadata, 				$(filter true,$(TARGET_USES_COLOR_METADATA)))
$(call add_json_bool,		Uses_qcom_um_family, 					$(filter true,$(TARGET_USES_QCOM_UM_FAMILY)))
$(call add_json_bool,		Uses_qcom_um_3_18_family, 				$(filter true,$(TARGET_USES_QCOM_UM_3_18_FAMILY)))
$(call add_json_bool,		Uses_qcom_um_4_4_family, 				$(filter true,$(TARGET_USES_QCOM_UM_4_4_FAMILY)))
$(call add_json_bool,		Uses_qcom_um_4_9_family, 				$(filter true,$(TARGET_USES_QCOM_UM_4_9_FAMILY)))
$(call add_json_bool,		Uses_qcom_um_4_14_family, 				$(filter true,$(TARGET_USES_QCOM_UM_4_14_FAMILY)))

$(call end_json_map)
