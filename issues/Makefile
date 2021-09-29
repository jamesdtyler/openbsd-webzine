generate-site:
	ls | grep issue- | sort -n | xargs tools/make_issue.sh
	tools/make_issue.sh _index ../public/index.html
	tools/sitemap.sh webzine.puffy.cafe ../public/ > ../public/sitemap.xml
	gzip -9 -c ../public/sitemap.xml > ../public/sitemap.gz
	tools/atom.sh webzine.puffy.cafe > ../public/atom.xml

all: generate-site

all: generate-site

clean:
	rm ../dev/*html

test:
	tools/make_issue.sh current /tmp/current-issue.html
	xdg-open /tmp/current-issue.html

testsite: generate-site
	cp -fr ../public /tmp/
	xdg-open /tmp/public/index.html
