package android
type Product_variables struct {
	Additional_gralloc_10_usage_bits struct {
		Cppflags []string
	}
	Should_skip_waiting_for_qsee struct {
		Cflags []string
	}
	Supports_hw_fde struct {
		Cflags []string
		Header_libs []string
		Shared_libs []string
	}
	Supports_hw_fde_perf struct {
		Cflags []string
	}
	Target_init_vendor_lib struct {
		Whole_static_libs []string
	}
	Target_process_sdk_version_override struct {
		Cppflags []string
	}
	Target_shim_libs struct {
		Cppflags []string
	}
	Target_uses_color_metadata struct {
		Cppflags []string
	}
	Uses_qcom_um_family struct {
		Cflags []string
		Shared_libs []string
	}
	Uses_qcom_um_3_18_family struct {
		Include_dirs []string
		Header_libs []string
		Shared_libs []string
	}
	Uses_qcom_um_4_4_family struct {
		Include_dirs []string
		Header_libs []string
		Shared_libs []string
	}
	Uses_qcom_um_4_9_family struct {
		Include_dirs []string
		Header_libs []string
		Shared_libs []string
	}
	Uses_qcom_um_4_14_family struct {
		Include_dirs []string
		Header_libs []string
		Shared_libs []string
	}
	Uses_qti_camera_device struct {
		Cppflags []string
		Shared_libs []string
	}
	Uses_qcom_bsp_legacy struct {
		Cppflags []string
	}
}

type ProductVariables struct {
	Additional_gralloc_10_usage_bits        *string `json:",omitempty"`
	Should_skip_waiting_for_qsee            *bool `json:",omitempty"`
	Supports_hw_fde                         *bool `json:",omitempty"`
	Supports_hw_fde_perf                    *bool `json:",omitempty"`
 	Target_init_vendor_lib                  *string `json:",omitempty"`
	Target_process_sdk_version_override     *string `json:",omitempty"`
	Target_shim_libs                        *string `json:",omitempty"`
	Target_uses_color_metadata              *bool `json:",omitempty"`
	Uses_qcom_um_family                     *bool `json:",omitempty"`
	Uses_qcom_um_3_18_family                *bool `json:",omitempty"`
	Uses_qcom_um_4_4_family                 *bool `json:",omitempty"`
	Uses_qcom_um_4_9_family                 *bool `json:",omitempty"`
	Uses_qcom_um_4_14_family                *bool `json:",omitempty"`
	Uses_qti_camera_device                  *bool `json:",omitempty"`
	Uses_qcom_bsp_legacy                    *bool `json:",omitempty"`
}
