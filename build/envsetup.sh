function __print_pixeldust_functions_help() {
cat <<EOF
Additional PixelDust functions:
- clomerge:        Utility to merge CLO tags.
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

function clomerge() {
    target_branch=$1
    set_stuff_for_environment
    T=$(gettop)
    python3 $T/vendor/pixeldust/build/tools/merge-clo.py $target_branch
}

export SKIP_ABI_CHECKS="true"

# Override host metadata to make builds more reproducible and avoid leaking info
export BUILD_USERNAME=nobody
export BUILD_HOSTNAME=android-build
