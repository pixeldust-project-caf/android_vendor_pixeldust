#!/bin/bash
# PixelDust build helper script
# original author: AOSPA

# red = errors, cyan = warnings, green = confirmations, blue = informational
# plain for generic text, bold for titles, reset flag at each end of line
# plain blue should not be used for readability reasons - use plain cyan instead
CLR_RST=$(tput sgr0)                        ## reset flag
CLR_RED=$CLR_RST$(tput setaf 1)             #  red, plain
CLR_GRN=$CLR_RST$(tput setaf 2)             #  green, plain
CLR_BLU=$CLR_RST$(tput setaf 4)             #  blue, plain
CLR_CYA=$CLR_RST$(tput setaf 6)             #  cyan, plain
CLR_BLD=$(tput bold)                        ## bold flag
CLR_BLD_RED=$CLR_RST$CLR_BLD$(tput setaf 1) #  red, bold
CLR_BLD_GRN=$CLR_RST$CLR_BLD$(tput setaf 2) #  green, bold
CLR_BLD_BLU=$CLR_RST$CLR_BLD$(tput setaf 4) #  blue, bold
CLR_BLD_CYA=$CLR_RST$CLR_BLD$(tput setaf 6) #  cyan, bold

# Set defaults
BUILD_TYPE="userdebug"

# Output usage help
function showHelpAndExit {
        echo -e "${CLR_BLD_BLU}Usage: $0 <device> [options]${CLR_RST}"
        echo -e ""
        echo -e "${CLR_BLD_BLU}Options:${CLR_RST}"
        echo -e "${CLR_BLD_BLU}  -h, --help            Display this help message${CLR_RST}"
        echo -e "${CLR_BLD_BLU}  -c, --clean           Wipe the tree before building${CLR_RST}"
        echo -e "${CLR_BLD_BLU}  -i, --installclean    Dirty build - Use 'installclean'${CLR_RST}"
        echo -e "${CLR_BLD_BLU}  -r, --repo-sync       Sync before building${CLR_RST}"
        echo -e "${CLR_BLD_BLU}  -v, --variant         PD variant - Can be dev, alpha, beta or release${CLR_RST}"
        echo -e "${CLR_BLD_BLU}  -t, --build-type      Specify build type - Can be userdebug (default) or user${CLR_RST}"
        echo -e "${CLR_BLD_BLU}  -j, --jobs            Specify jobs/threads to use${CLR_RST}"
        echo -e "${CLR_BLD_BLU}  -m, --module          Build a specific module${CLR_RST}"
        echo -e "${CLR_BLD_BLU}  -s, --sign-keys       Specify path to sign key mappings${CLR_RST}"
        echo -e "${CLR_BLD_BLU}  -p, --pwfile          Specify path to sign key password file${CLR_RST}"
        echo -e "${CLR_BLD_BLU}  -b, --backup-unsigned Store a copy of unsignied package along with signed${CLR_RST}"
        exit 1
}

# Setup getopt.
long_opts="help,clean,installclean,repo-sync,variant:,build-type:,jobs:,module:,sign-keys:,pwfile:,backup-unsigned"
getopt_cmd=$(getopt -o hcirv:t:j:m:s:p:b --long "$long_opts" \
            -n $(basename $0) -- "$@") || \
            { echo -e "${CLR_BLD_RED}\nError: Getopt failed. Extra args\n${CLR_RST}"; showHelpAndExit; exit 1;}

eval set -- "$getopt_cmd"

while true; do
    case "$1" in
        -h|--help|h|help) showHelpAndExit;;
        -c|--clean|c|clean) FLAG_CLEAN_BUILD=y;;
        -i|--installclean|i|installclean) FLAG_INSTALLCLEAN_BUILD=y;;
        -r|--repo-sync|r|repo-sync) FLAG_SYNC=y;;
        -v|--variant|v|variant) PD_VARIANT="$2"; shift;;
        -t|--build-type|t|build-type) BUILD_TYPE="$2"; shift;;
        -j|--jobs|j|jobs) JOBS="$2"; shift;;
        -m|--module|m|module) MODULE="$2"; shift;;
        -s|--sign-keys|s|sign-keys) KEY_MAPPINGS="$2"; shift;;
        -p|--pwfile|p|pwfile) PWFILE="$2"; shift;;
        -b|--backup-unsigned|b|backup-unsigned) FLAG_BACKUP_UNSIGNED=y;;
        --) shift; break;;
    esac
    shift
done

# Mandatory argument
if [ $# -eq 0 ]; then
    echo -e "${CLR_BLD_RED}Error: No device specified${CLR_RST}"
    showHelpAndExit
fi
export DEVICE="$1"; shift

# Make sure we are running on 64-bit before carrying on with anything
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
if [ "$ARCH" != "64" ]; then
        echo -e "${CLR_BLD_RED}error: unsupported arch (expected: 64, found: $ARCH)${CLR_RST}"
        exit 1
fi

# Set up paths
cd $(dirname $0)
DIR_ROOT=$(pwd)

# Make sure everything looks sane so far
if [ ! -d "$DIR_ROOT/vendor/pixeldust" ]; then
        echo -e "${CLR_BLD_RED}error: insane root directory ($DIR_ROOT)${CLR_RST}"
        exit 1
fi

# Setup PD variant if specified
if [ $PD_VARIANT ]; then
    PD_VARIANT=`echo $PD_VARIANT |  tr "[:upper:]" "[:lower:]"`
    if [ "${PD_VARIANT}" = "release" ]; then
        export PD_BUILDTYPE=RELEASE
    elif [ "${PD_VARIANT}" = "alpha" ]; then
        export PD_BUILDTYPE=ALPHA
    elif [ "${PD_VARIANT}" = "beta" ]; then
        export PD_BUILDTYPE=BETA
    elif [ "${PD_VARIANT}" = "dev" ]; then
        export PD_BUILDTYPE=DEV
    else
        echo -e "${CLR_BLD_RED} Unknown PD variant - use alpha, beta or release${CLR_RST}"
        exit 1
    fi
fi

# Initializationizing!
echo -e "${CLR_BLD_BLU}Setting up the environment${CLR_RST}"
echo -e ""
. build/envsetup.sh
echo -e ""

# Use the thread count specified by user
CMD=""
if [ $JOBS ]; then
  CMD+=" -j$JOBS"
fi

# Pick the default thread count (allow overrides from the environment)
if [ -z "$JOBS" ]; then
        if [ "$(uname -s)" = 'Darwin' ]; then
                JOBS=$(sysctl -n machdep.cpu.core_count)
        else
                JOBS=$(cat /proc/cpuinfo | grep '^processor' | wc -l)
        fi
fi

# Use mka when available and jobs not specified
if [ "$(command -v 'mka')" ]; then
  if [ -z "${CMD}" ]; then
    MAKE="mka"
  else
    MAKE="make"
  fi
else
  MAKE="make"
fi

# Grab the build version
PD_DISPLAY_VERSION="$(cat $DIR_ROOT/vendor/pixeldust/configs/version.mk | grep 'ROM_VERSION := *' | sed 's/.*= //') \
$(cat $DIR_ROOT/vendor/pixeldust/configs/version.mk | grep 'BUILD_VERSION := *' | sed 's/.*= //')"

# Prep for a clean build, if requested so
if [ "$FLAG_CLEAN_BUILD" = 'y' ]; then
        echo -e "${CLR_BLD_BLU}Cleaning output files left from old builds${CLR_RST}"
        echo -e ""
        ${MAKE} clobber"$CMD"
fi

# Prep for a installclean build, if requested so
if [ "$FLAG_INSTALLCLEAN_BUILD" = 'y' ]; then
        echo -e "${CLR_BLD_BLU}Cleaning compiled image files left from old builds${CLR_RST}"
        echo -e ""
        ${MAKE} installclean"$CMD"
fi

# Sync up, if asked to
if [ "$FLAG_SYNC" = 'y' ]; then
        echo -e "${CLR_BLD_BLU}Downloading the latest source files${CLR_RST}"
        echo -e ""
        repo sync -j"$JOBS" -c --no-clone-bundle --current-branch --no-tags
fi

# Check the starting time (of the real build process)
TIME_START=$(date +%s.%N)

# Friendly logging to tell the user everything is working fine is always nice
echo -e "${CLR_BLD_GRN}Building $PD_DISPLAY_VERSION for $DEVICE${CLR_RST}"
echo -e "${CLR_GRN}Start time: $(date)${CLR_RST}"
echo -e ""

# Lunch-time!
echo -e "${CLR_BLD_BLU}Lunching $DEVICE${CLR_RST} ${CLR_CYA}(Including dependencies sync)${CLR_RST}"
echo -e ""
PD_VERSION=$(lunch "pixeldust_$DEVICE-$BUILD_TYPE" | grep 'PD_VERSION=*' | sed 's/.*=//')
lunch "pixeldust_$DEVICE-$BUILD_TYPE"
echo -e ""

# Build away!
RETVAL=0

echo -e "${CLR_BLD_BLU}Starting compilation${CLR_RST}"
echo -e ""
# Build a specific module
if [ "${MODULE}" ]; then
    ${MAKE} $MODULE"$CMD"
# Build signed rom package if specified
elif [ "${KEY_MAPPINGS}" ]; then
    # Set sign key password file if specified
    if [ "${PWFILE}" ]; then
        export ANDROID_PW_FILE=$PWFILE
    fi
    # Generate otapackage if in need of unsigned build
    if [ "$FLAG_BACKUP_UNSIGNED" = 'y' ]; then
        ${MAKE} bacon"$CMD"
        mv $OUT/pixeldust-${PD_VERSION}.zip $DIR_ROOT/pixeldust-${PD_VERSION}-unsigned.zip
    else
        ${MAKE} target-files-package otatools"$CMD"
    fi
    echo -e "${CLR_BLD_BLU}Signing target files apks${CLR_RST}"
    ./build/tools/releasetools/sign_target_files_apks -o -d $KEY_MAPPINGS \
    $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip \
    pixeldust_signed-target_files.zip
    echo -e "${CLR_BLD_BLU}Generating signed install package${CLR_RST}"
    ./build/tools/releasetools/ota_from_target_files -k $KEY_MAPPINGS/releasekey \
    --block --backup=true \
    pixeldust_signed-target_files.zip \
    pixeldust-${PD_VERSION}.zip
# Build rom package
else
    ${MAKE} pixeldust"$CMD"
    cp $OUT/pixeldust-${PD_VERSION}.zip $DIR_ROOT
fi
RETVAL=$?
echo -e ""

# Check if the build failed
if [ $RETVAL -ne 0 ]; then
        echo "${CLR_BLD_RED}Build failed!${CLR_RST}"
        echo -e ""
fi

# Check the finishing time
TIME_END=$(date +%s.%N)

# Log those times at the end as a fun fact of the day
echo -e "${CLR_BLD_GRN}Total time elapsed:${CLR_RST} ${CLR_GRN}$(echo "($TIME_END - $TIME_START) / 60" | bc) minutes ($(echo "$TIME_END - $TIME_START" | bc) seconds)${CLR_RST}"
echo -e ""

exit $RETVAL
