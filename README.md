# flp.mobi

## "What's this?"

A toolchain to build a MOBI from Caltech's new [online edition of the
Feynman Lectures](http://www.feynmanlectures.caltech.edu/), so you've a
copy to read offline on your Kindle. We use EPUB as an intermediate
representation, so likelihood is you'll get something working on your
iPocketKoboNook too.

## "How do I run it?"

    % make

## "No, really."

Okay, you're probably missing some dependencies. We're
using [wget](https://www.gnu.org/software/wget/)
to download the pages at CalTech, [Ruby](https://www.ruby-lang.org/en/)
and [nokogiri](http://nokogiri.org/) to process them (replacing equations
with images using two tools from [TeXLive](https://www.tug.org/texlive/)), 
[pandoc](http://johnmacfarlane.net/pandoc/) to write the result to
a self-contained EPUB, and finally one of
[Calibre](http://calibre-ebook.com/)'s command-line tools to convert that to
MOBI..

(Sorry.)

## "May I..?"

Probably! This work is licensed under a Creative Commons
Attribution 3.0 Unported License, details of which may be found
[here](http://creativecommons.org/licenses/by/3.0/).

<a rel="license" href="http://creativecommons.org/licenses/by/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by/3.0/88x31.png" /></a>
