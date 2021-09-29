#!/bin/sh
set -e
domain="$1"
cd "$2"

feed_updated=$(date +%Y-%m-%dT%TZ)

cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
<id>https://${domain}/log/</id>
<title>OpenBSD Webzine</title>
<icon>https://${domain}/favicon.png</icon>
<link rel="alternate" type="text/html" href="https://${domain}/" />
<link rel="self" type="application/atom+xml" href="https://${domain}/atom.xml" />
<author><name>OpenBSD Webzine contributors</name></author>
<updated>${feed_updated}</updated>
EOF

for page in *.html; do
	updated="$(date -ur $(stat -f %m ${page}) +%Y-%m-%dT%TZ)"

	title="${page%-.*}"
	tag="$(echo -n ${page} | sha256)"

	cat <<EOF
<entry>
<title type="text">${title}</title>
<id>tag:${domain},2021:${tag}</id>
<updated>${updated}</updated>
<link rel="alternate" type="text/html" href="https://${domain}/${page}" />
<content type="html">
<![CDATA[
$(cat $page)
]]>
</content>
</entry>
EOF
done

echo "</feed>"

exit
