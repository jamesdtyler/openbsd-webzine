#!/bin/sh

usage() {
    echo "$0 directory"
    exit 1
}

die() {
    echo "$1"
    exit 1
}

testsite=0
if [ "$1" = "-t" ]
then
    testsite=1
    shift
fi

DIR=$(basename $1)
DESTFILENAME=$2
CURINODE=$(stat -f "%i" current/)

test -d "$DIR" || usage
test -d ../public/ || die "You must run this from openbsd-webzine/current"
ls $DIR/*.html 2>&1 >/dev/null || die "no html file in $DIR"

. ./${DIR}/metadata.sh

if [ "$testsite" -eq 0 ] && [ "$(stat -f '%i' $DIR)" -eq "$CURINODE" ]
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

if ! [ "$DIR" = "_index" ]
then
    # replace with issue number
    issue="${1#issue-}"
    sed -i "s/__ISSUE__/${issue}/g" $DESTFILENAME
else
    sed -i "s/OpenBSD_WEBZINE_ISSUE #__ISSUE__/The OpenBSD Webzine/g" $DESTFILENAME
fi

# replace date
sed -i "s/__DATE__/${PUBLISHED_DATE}/" $DESTFILENAME
