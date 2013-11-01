dl: clean
	wget -c -rnH -k -np http://www.feynmanlectures.caltech.edu/

preprocess:
	./bin/macros < I_01.html > template/macros.tex
	./bin/chapters | xargs ./bin/preprocess

epub: preprocess
	cp -r ./template/epub/* .
	./bin/opf content.opf
	(./bin/chapters; ./bin/images) | zip -@ flp.epub mimetype META-INF/* content.opf

mobi: epub
	ebook-convert flp.epub flp.mobi

convert: epub mobi

clean:
	git clean -Xfd

all: dl convert
