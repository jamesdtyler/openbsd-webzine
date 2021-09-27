all:
	find . -maxdepth 1 -type d -name 'issue-*' -exec ./make_issue.sh {} \;
	./make_issue.sh _index ../public/index.html

clean:
	rm ../dev/*html

test:
	./make_issue.sh current ~/Downloads/current-issue.html
	xdg-open ~/Downloads/current-issue.html

testsite:
	cp -fr ../public ~/Downloads/
	xdg-open ~/Downloads/public/index.html
