function __print_pixeldust_functions_help() {
cat <<EOF
Additional PixelDust functions:
- cout:            Changes directory to out.
- repopick:        Utility to fetch changes from Gerrit.
EOF
}

function cout()
{
    if [  "$OUT" ]; then
        cd $OUT
    else
        echo "Couldn't locate out directory.  Try setting OUT."
    fi
}

function repopick() {
    T=$(gettop)
    $T/vendor/pixeldust/build/tools/repopick.py $@
}

export SKIP_ABI_CHECKS="true"
export DISABLE_ARTIFACT_PATH_REQUIREMENTS="true"

# Override host metadata to make builds more reproducible and avoid leaking info
export BUILD_USERNAME=nobody
export BUILD_HOSTNAME=android-build
