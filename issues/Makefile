all:
	find . -maxdepth 1 -type d -name 'issue-*' -exec ./make_issue.sh {} \;

clean:
	rm ../dev/*html

test:
	./make_issue.sh current/ && cp ../dev/*.html ~/Downloads/current-issue.html
	xdg-open ~/Downloads/current-issue.html
