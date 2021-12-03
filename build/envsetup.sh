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
