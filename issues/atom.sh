#!/bin/sh
set -e
domain="$1"

# exit if no public issue found
ls ../public/issue-*.html >/dev/null 2>&1

date_updated=$(date +%Y-%m-%dT%TZ)

cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
  <feed xmlns="http://www.w3.org/2005/Atom">
  <id>https://${domain}/log/</id>
  <title>OpenBSD Webzine</title>
  <icon>https://${domain}/favicon.png</icon>
  <link rel="alternate" type="text/html" href="https://${domain}/" />
  <link rel="self" type="application/atom+xml" href="https://${domain}/atom.xml" />
  <author>
    <name>OpenBSD Webzine contributors</name>
  </author>
  <updated>${date_updated}</updated>
EOF

for page in ../public/issue-*.html ; do
    issue=$(echo $page | grep -oE "issue\-[0-9]+")
    title=$(echo $issue | awk -F '-' '{ print "Issue #"$NF }')
    . ./$issue/metadata.sh
    tag="$(echo -n ${issue} | sha256)"

    cat <<EOF
  <entry>
    <title type="text">${title}</title>
    <id>tag:${domain},2021:${tag}</id>
    <updated>${PUBLISHED_DATE}</updated>
    <link rel="alternate" type="text/html" href="https://${domain}/${issue}.html" />
    <content type="html">
<![CDATA[
$(cat $page)
]]>
</content>
  </entry>
EOF
done

echo "</feed>"
