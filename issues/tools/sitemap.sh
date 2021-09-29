#!/bin/sh
ndd="$1"

printf '%s\n' \
'<?xml version="1.0" encoding="UTF-8"?>
<urlset
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd"
xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'

cd "$2"
find . -name \*.html | while read -r l
do
	link="$(printf "%s" ${l} | cut -d'/' -f2-)"
	printf '<url><loc>%s</loc><lastmod>%s</lastmod></url>\n' \
		"https://${ndd}/${link}"\
		"$(date -r $(stat -f %m ${l}) +%Y-%m-%d)"
done

printf '%s' '</urlset>'
