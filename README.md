##### "What's this?"

A toolchain to build a collection of MOBIs from Caltech's new [online edition
of the Feynman Lectures](http://www.feynmanlectures.caltech.edu/), so you can
read them offline on your Kindle. We use EPUB as an intermediate
representation, so likelihood is you'll get something working on your
iPocketKoboNook too.

##### "How do I run it?"

    % make

##### "No, really."

Okay, you're probably missing some dependencies. We're using
[wget](https://www.gnu.org/software/wget/) to download the pages at CalTech,
two tools from [TeXLive](https://www.tug.org/texlive/) to replace equations
with images, [ImageMagick's](http://www.imagemagick.org/script/index.php) 
`convert` to rasterize vector diagrams, a couple [Ruby](https://www.ruby-lang.org/en/)
scripts (using [`nokogiri`](http://nokogiri.org/) and [`mime/types`](http://mime-types.rubyforge.org/))
to munge the result into a self-contained EPUB, and finally one of
[Calibre](http://calibre-ebook.com/)'s command-line tools to convert that to
MOBI..

(Sorry.)

##### "May I..?"

Probably! This work is licensed under a Creative Commons
Attribution 3.0 Unported License, details of which may be found
[here](http://creativecommons.org/licenses/by/3.0/).

<a rel="license" href="http://creativecommons.org/licenses/by/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by/3.0/88x31.png" /></a>
