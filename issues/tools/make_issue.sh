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
    sed -i "s/__TITLE__/issue #${issue}/g" $DESTFILENAME
    sed -i "s/__FILENAME__/issue-${issue}.html/" $DESTFILENAME
    # replace date
    DATETIME="$(date -j -f "%Y-%m-%dT%H:%M:%SZ" "${PUBLISHED_DATE}" +"%xT%XZ")" 2>/dev/null
    HUMAN_DATE="$(date -j -f "%Y-%m-%dT%H:%M:%SZ" "${PUBLISHED_DATE}" +"%B %e, %Y")" 2>/dev/null

    if [ $? -ne 0 ]; then
        echo "err: Please fill ${DIR}/metadata.sh with ISO-8601 valid date"
        exit 1
    else
		sed -i "s/__DATETIME__/${DATETIME}/" $DESTFILENAME
        sed -i "s/__HUMAN_DATE__/${HUMAN_DATE}/" $DESTFILENAME
    fi
else
    # index.html changes
    sed -i "s/OpenBSD_WEBZINE_ISSUE #__ISSUE__/The OpenBSD Webzine/g" $DESTFILENAME
    sed -i "s/__TITLE__/homepage/g" $DESTFILENAME
    sed -i "s/__FILENAME__/index.html/" $DESTFILENAME
fi

