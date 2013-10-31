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

epub: replace preprocess
	cp -r ./template/epub/* .
	grep -oP '(?<=img src=")[^"]*(?=")' flp.html | xargs zip flp.epub mimetype META-INF/* content.opf flp.html

mobi: epub
	ebook-convert flp.epub flp.mobi

convert: epub mobi

clean:
	git clean -Xf

all: dl convert
