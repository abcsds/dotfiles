function pyedit() {
    # about 'opens python module in your EDITOR'
    # param '1: python module to open'
    # example '$ pyedit requests'
    # group 'python'

    xpyc=`python -c "import sys; stdout = sys.stdout; sys.stdout = sys.stderr; import $1; stdout.write($1.__file__)"`

    if [ "$xpyc" == "" ]; then
        echo "Python module $1 not found"
        return -1

    elif [[ $xpyc == *__init__.py* ]]; then
        xpydir=`dirname $xpyc`;
        echo "$EDITOR $xpydir";
        $EDITOR "$xpydir";
    else
        echo "$EDITOR ${xpyc%.*}.py";
        $EDITOR "${xpyc%.*}.py";
    fi
}
