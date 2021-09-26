#!/bin/sh

usage() {
    echo "./$0 directory"
    exit 1
}

die() {
    echo "$1"
    exit 1
}

DIR=$(basename $1)
CURINODE=$(stat -f "%i" current/)

test -d "$DIR" || usage
test -d ../public/ || die "You must run this from openbsd-webzine/current"
ls $DIR/*.html 2>&1 >/dev/null || die "no html file in $DIR"

if [ "$(stat -f '%i' $DIR)" -eq "$CURINODE" ]
then
    DEST=dev
else
    DEST=public
fi

cat _common/header $DIR/*html _common/footer > ../${DEST}/${DIR}.html
