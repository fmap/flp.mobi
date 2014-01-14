v=I
prereqs=zip bundle wget ebook-convert
vols=I II III

all: test-prereqs I_01.html II_01.html III_01.html
	for volume in $(vols);  \
		do $(MAKE) convert v=$$volume;  \
	done

test-prereqs:
	which $(prereqs)

%.html: 
	wget -c -rnH -k -np http://www.feynmanlectures.caltech.edu/{I,II,III}_toc.html || true

gems: Gemfile
	bundle install

preprocess: gems
	./bin/macros < $(v)_01.html > template/macros.tex
	./bin/chapters $(v) | xargs ./bin/preprocess

epub: preprocess
	cp -r ./template/epub/* .
	./bin/opf $(v) content.opf
	(./bin/chapters $(v); ./bin/images $(v)) | zip -@ flp$(v).epub mimetype META-INF/* content.opf

mobi: epub
	ebook-convert flp$(v).epub flp$(v).mobi

convert: epub mobi

clean:
	git clean -Xfd
