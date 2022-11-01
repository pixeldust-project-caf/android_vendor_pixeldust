#!/bin/bash
#
# Copyright (C) 2019-2022 crDroid Android Project
# Copyright (C) 2022 The PixelDust Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#$1=TARGET_DEVICE, $2=PRODUCT_OUT, $3=FILE_NAME, $4=BUILD_TIMESTAMP, $5=ANDROID_OS_VERSION
existingOTAjson=./vendor/PixeldustOTA/$1.json
output=$2/$1.json

#cleanup old file
if [ -f $output ]; then
	rm $output
fi

if [ -f $existingOTAjson ]; then
	#get data from already existing device json
	#there might be a better way to parse json yet here we try without adding more dependencies like jq
	filename=$3
	filehash=`md5sum "$2/$3" | cut -d' ' -f1`
	size=`stat -c "%s" "$2/$3"`
	datetime=$4
	url="https://download.pixeldust-project.com/$filename"
	version=$5
	maintainer=`grep -n "\"maintainer\"" $existingOTAjson | cut -d ":" -f 3 | sed 's/"//g' | sed 's/,//g' | xargs`
	maintainer_url=`grep -n "\"maintainer_url\"" $existingOTAjson | cut -d ":" -f 4 | sed 's/"//g' | sed 's/,//g' | xargs`
	if [ ! -z "$maintainer_url" ]; then
		maintainer_url="https:"$maintainer_url
	fi
	donate_url=`grep -n "\"donate_url\"" $existingOTAjson | cut -d ":" -f 4 | sed 's/"//g' | sed 's/,//g' | xargs`
	if [ ! -z "$donate_url" ]; then
		donate_url="https:"$donate_url
	fi
	forum_url=`grep -n "\"forum_url\"" $existingOTAjson | cut -d ":" -f 4 | sed 's/"//g' | sed 's/,//g' | xargs`
	if [ ! -z "$forum_url" ]; then
		forum_url="https:"$forum_url
	fi
	website_url=`grep -n "\"website_url\"" $existingOTAjson | cut -d ":" -f 4 | sed 's/"//g' | sed 's/,//g' | xargs`
	if [ ! -z "$website_url" ]; then
		website_url="https:"$website_url
	fi
	news_url=`grep -n "\"news_url\"" $existingOTAjson | cut -d ":" -f 4 | sed 's/"//g' | sed 's/,//g' | xargs`
	if [ ! -z "$news_url" ]; then
		news_url="https:"$news_url
	fi

	echo '{
	"filename":"'$filename'",
	"filehash":"'$filehash'",
	"size":'$size',
	"datetime":'$datetime',
	"url":"'$url'",
	"version":"'$version'",
	"maintainer":"'$maintainer'",
	"maintainer_url":"'$maintainer_url'",
	"donate_url":"'$donate_url'",
	"forum_url":"'$forum_url'",
	"website_url":"'$website_url'",
	"news_url":"'$news_url'"
}' >> $output

        echo "JSON file data for OTA support:"
else
	#if not already supported, create dummy file with info in it on how to
	echo 'There is no official support for this device yet' >> $output;
	echo 'Consider adding official support by reading the documentation at https://github.com/pixeldust-project-caf/android_vendor_PixeldustOTA/blob/tartufo/README.md' >> $output;
fi

cat $output
echo ""
