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
DESTFILENAME=$2
CURINODE=$(stat -f "%i" current/)

test -d "$DIR" || usage
test -d ../public/ || die "You must run this from openbsd-webzine/current"
ls $DIR/*.html 2>&1 >/dev/null || die "no html file in $DIR"

. ./${DIR}/metadata.sh

if [ "$(stat -f '%i' $DIR)" -eq "$CURINODE" ]
then
    DEST=dev
else
    DEST=public
fi

if test -z "$DESTFILENAME"
then
    DESTFILENAME="../${DEST}/${DIR}.html"
fi

cat _common/header $DIR/*html _common/footer > $DESTFILENAME

# replace with issue number
issue="${1#issue-}"
sed -i "s/__ISSUE__/${issue}/g" $DESTFILENAME

# replace date
sed -i "s/__DATE__/${PUBLISHED_DATE}/" $DESTFILENAME
