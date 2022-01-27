function __print_pixeldust_functions_help() {
cat <<EOF
Additional PixelDust functions:
- cout:            Changes directory to out.
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

export SKIP_ABI_CHECKS="true"
export DISABLE_ARTIFACT_PATH_REQUIREMENTS="true"

# Override host metadata to make builds more reproducible and avoid leaking info
export BUILD_USERNAME=nobody
export BUILD_HOSTNAME=android-build
