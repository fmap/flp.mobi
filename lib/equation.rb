require 'cgi'

class Equation
  def initialize str
    @tex = str
    remove_fragments
    add_tag
  end
  def add_tag
    if @tex.match(/\label{Eq:I:(\d+):(\d+)}/)
      @tex.sub! ?}, "}\\tag{#{$1}.#{$2}}"
    end
  end
  def remove_fragments
    @tex = CGI::unescapeHTML(@tex).gsub(?&,'\&') 
  end
  def to_image
    str = @tex.inspect[1..-2]
    bin = File.join File.dirname(__FILE__), '..', 'bin'
    cmd = [bin, 'eq2img'].join('/')
    IO.popen([cmd, str]).read.chomp
  end
  def for_html
    ['<img src="', to_image, '">'].join
  end
end
