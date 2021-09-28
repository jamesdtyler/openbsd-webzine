all:
	ls | grep issue- | sort -n | xargs ./make_issue.sh
	./make_issue.sh _index ../public/index.html

clean:
	rm ../dev/*html

test:
	./make_issue.sh current /tmp/current-issue.html
	xdg-open ~/tmp/current-issue.html

testsite:
	cp -fr ../public ~/tmp/
	xdg-open ~/tmp/public/index.html
