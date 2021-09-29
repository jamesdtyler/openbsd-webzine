TEMPDIR=/tmp/openbsd-webzine/

generate-site:
	ls | grep issue- | sort -n | xargs tools/make_issue.sh
	tools/make_issue.sh _index ../public/index.html
	tools/sitemap.sh webzine.puffy.cafe ../public/ > ../public/sitemap.xml
	gzip -9 -c ../public/sitemap.xml > ../public/sitemap.gz
	tools/atom.sh webzine.puffy.cafe > ../public/atom.xml

all: generate-site

clean:
	rm -f ../dev/*html ../public/*

test:
	mkdir -p ${TEMPDIR}
	tools/make_issue.sh current ${TEMPDIR}/current-issue.html
	xdg-open ${TEMPDIR}/current-issue.html

testsite: clean
	ls | grep issue- | sort -n | xargs tools/make_issue.sh -t
	tools/make_issue.sh _index ../public/index.html
	mkdir -p ${TEMPDIR}
	cp -fr ../public ${TEMPDIR}/
	xdg-open ${TEMPDIR}/public/index.html
