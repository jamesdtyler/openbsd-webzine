TEMPDIR=/tmp/openbsd-webzine/

generate-site: clean
	ls | grep issue- | sort -n | xargs ./make_issue.sh
	./make_issue.sh _index ../public/index.html

all: generate-site

clean:
	rm -f ../dev/*html ../public/*

test:
	mkdir -p ${TEMPDIR}
	./make_issue.sh current ${TEMPDIR}/current-issue.html
	xdg-open ${TEMPDIR}/current-issue.html

testsite: clean
	ls | grep issue- | sort -n | xargs ./make_issue.sh -t
	./make_issue.sh _index ../public/index.html
	mkdir -p ${TEMPDIR}
	cp -fr ../public ${TEMPDIR}/
	xdg-open ${TEMPDIR}/public/index.html
