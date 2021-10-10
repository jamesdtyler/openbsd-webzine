#!/bin/sh

die() {
    echo "$1"
    exit 1
}

test -d ../public/ || die "You must run this from openbsd-webzine/current"

find ../public/ -name '*.html' -or -name '*.xml' | while read file
do
    gzip -9 -c "${file}" > "${file}.gz"
done
