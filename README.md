##### "What's this?"

A toolchain to build a collection of MOBIs from Caltech's new [online edition
of the Feynman Lectures](http://www.feynmanlectures.caltech.edu/), so you can
read them offline on your Kindle. We use EPUB as an intermediate
representation, so likelihood is you'll get something working on your
iPocketKoboNook too.

##### "How do I create the MOBI format?"

Okay, you're probably missing some dependencies. We're using
[wget](https://www.gnu.org/software/wget/) to download the pages at CalTech,
two tools from [TeXLive](https://www.tug.org/texlive/) to replace equations
with images, [ImageMagick's](http://www.imagemagick.org/script/index.php) 
`convert` to rasterize vector diagrams, a couple [Ruby](https://www.ruby-lang.org/en/)
scripts (using [`nokogiri`](http://nokogiri.org/) and [`mime/types`](http://mime-types.rubyforge.org/))
to munge the result into a self-contained EPUB, and finally one of
[Calibre](http://calibre-ebook.com/)'s command-line tools to convert that to
MOBI..


1. run make in the command line and a bunch of `*.html` files will be created [will take a few minutes]

    ```
    make
    ```

1. [download Calibre](http://calibre-ebook.com/download)
1. install the [command line tools of Calibre](http://manual.calibre-ebook.com/cli/cli-index.html)

    ```
    Preferences > Advanced > Miscellaneous > click install command line tools 
    ```
1. combine all the created `*.html` files into one file

    ```
    cat *.html >> feynman-lecture.html
    ```
1. run the installed command line tool with [`ebook-convert`](http://manual.calibre-ebook.com/cli/ebook-convert.html) [about 20-30 minutes]

    ```
    ebook-convert feynman-lecture.html feynman-lectures.mobi
    ```


##### "May I..?"

Probably! This work is licensed under a Creative Commons
Attribution 3.0 Unported License, details of which may be found
[here](http://creativecommons.org/licenses/by/3.0/).

<a rel="license" href="http://creativecommons.org/licenses/by/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by/3.0/88x31.png" /></a>
