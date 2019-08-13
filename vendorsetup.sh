#
# Copyright 2017 The Android Open Source Project
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

add_lunch_combo pixeldust_blueline-userdebug
add_lunch_combo pixeldust_blueline-user
add_lunch_combo pixeldust_marlin-userdebug
add_lunch_combo pixeldust_marlin-user
add_lunch_combo pixeldust_taimen-userdebug
add_lunch_combo pixeldust_taimen-user
add_lunch_combo pixeldust_tissot-userdebug
add_lunch_combo pixeldust_tissot-user
add_lunch_combo pixeldust_sailfish-userdebug
add_lunch_combo pixeldust_sailfish-user
add_lunch_combo pixeldust_X01BD-userdebug
add_lunch_combo pixeldust_X01BD-user

# SDClang Environment Variables
export SDCLANG_AE_CONFIG=vendor/pixeldust/sdclang/sdclangAE.json
export SDCLANG_CONFIG=vendor/pixeldust/sdclang/sdclang.json
export SDCLANG_SA_ENABLED=false
