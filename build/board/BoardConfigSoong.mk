#
#    Copyright (C) 2023 The PixelDust Project
#    SPDX-License-Identifier: Apache-2.0
#

SOONG_CONFIG_NAMESPACES += pixeldustVarsPlugin

SOONG_CONFIG_pixeldustVarsPlugin :=

define addVar
  SOONG_CONFIG_pixeldustVarsPlugin += $(1)
  SOONG_CONFIG_pixeldustVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += pixeldustGlobalVars
SOONG_CONFIG_pixeldustGlobalVars +=

# Set default values

# Soong value variables
