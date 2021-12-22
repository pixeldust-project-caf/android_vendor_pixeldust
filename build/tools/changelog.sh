#!/bin/bash

Changelog=Changelog.txt

DEVICE=$1

if [ -f $Changelog ];
then
    rm -f $Changelog
fi

touch $Changelog

# define changelog_days using 'export changelog_days=10'
# this can be done before intiate build environment (. build/envsetup.sh) 
if [ -z $changelog_days ];then
	changelog_days=30
else
	if (($changelog_days > 30 )); then
        echo "Changelog can not generated for more than 30 days. For how many days do you want to generate changelog again? (🕑 timeout 15 seconds - default to 10 days)"
        read -r -t 15 changelog_days || changelog_days=10
	fi
fi

for i in $(seq $changelog_days);
do
After_Date=`date --date="$i days ago" +%m-%d-%Y`
k=$(expr $i - 1)
	Until_Date=`date --date="$k days ago" +%m-%d-%Y`

	# Line with after --- until was too long for a small ListView
	echo '====================' >> $Changelog;
	echo  "     "$Until_Date    >> $Changelog;
	echo '====================' >> $Changelog;
	# Cycle through every repo to find commits between 2 dates
	CURRENT_PATH="$(realpath `pwd`)"

    repo forall -i -c "GIT_LOG=\`git log --oneline --after=$After_Date --until=$Until_Date\` ; if [ ! -z \"\$GIT_LOG\" ]; then printf  '\n   * '; realpath \`pwd\` | sed 's|^$CURRENT_PATH/||' ; echo \"\$GIT_LOG\"; fi" >> $Changelog
	echo "" >> $Changelog;
done

sed -i 's/project/   */g' $Changelog

cp $Changelog $OUT_DIR/target/product/$DEVICE/system/etc/
mv $Changelog $OUT_DIR/target/product/$DEVICE/
