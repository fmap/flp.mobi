dl:
	wget -c -rnH -k -np http://www.feynmanlectures.caltech.edu/

macros:
	./bin/macros

concat:
	find * -maxdepth 0 -type f | grep -P 'I_\d+\.html' | xargs bin/concat > flp.html

replace: macros concat
	./bin/replace flp.html

preprocess: concat
	./bin/mxml flp.html

convert: replace preprocess
	pandoc flp.html -o flp.epub
	ebook-convert flp.epub flp.mobi

clean:
	find * -print0 | grep -vzE '^(Makefile|bin|template)' | xargs -0 rm -fr

all: dl convert
