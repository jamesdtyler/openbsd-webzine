TEMPDIR=/tmp/openbsd-webzine

generate-site: clean
	ls | grep issue- | sort -n | xargs -n 1 tools/make_issue.sh
	tools/make_issue.sh _index ../public/index.html
	cp -fr _static/* ../public/
	tools/sitemap.sh webzine.puffy.cafe ../public/ > ../public/sitemap.xml
	gzip -9 -c ../public/sitemap.xml > ../public/sitemap.gz
	tools/atom.sh webzine.puffy.cafe > ../public/atom.xml
	xmllint -format ../public/atom.xml

all: generate-site

clean:
	rm -fr ../dev/*html ../public/*

test:
	mkdir -p ${TEMPDIR}
	tools/make_issue.sh current ${TEMPDIR}/current-issue.html
	xdg-open ${TEMPDIR}/current-issue.html

# only difference with generate-site is make_issue.sh -t
testsite: clean
	ls | grep issue- | sort -n | xargs -n 1 tools/make_issue.sh -t
	tools/make_issue.sh _index ../public/index.html
	cp -fr _static/* ../public/
	tools/sitemap.sh webzine.puffy.cafe ../public/ > ../public/sitemap.xml
	gzip -9 -c ../public/sitemap.xml > ../public/sitemap.gz
	tools/atom.sh webzine.puffy.cafe > ../public/atom.xml
	xmllint -format ../public/atom.xml
	mkdir -p ${TEMPDIR}
	cp -fr ../public ${TEMPDIR}/
	xdg-open ${TEMPDIR}/public/index.html
