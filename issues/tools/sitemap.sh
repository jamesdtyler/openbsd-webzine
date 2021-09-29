#!/bin/sh
# print to stdout a sitemap.xml
set -e

usage()
{
    printf "usage $0 <domain.tld> <site_directory> %s\n"
    exit 1
}

test $# -eq 2 || usage

ndd="$1"

# sitemap header
printf '%s\n' \
'<?xml version="1.0" encoding="UTF-8"?>
<urlset
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd"
xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'

# list all pages in site_directory and print last mod time
cd "$2"
find . -name \*.html | cut -d'/' -f2- | while read -r page
do
	printf '<url><loc>%s</loc><lastmod>%s</lastmod></url>\n' \
                "https://${ndd}/${page}"\
                "$(date -r $(stat -f %m ${l}) +%Y-%m-%d)"
done

printf '%s' '</urlset>'

exit
