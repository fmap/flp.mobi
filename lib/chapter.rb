$:.unshift(File.join File.dirname(__FILE__), '..')

require 'nokogiri'
require 'lib/equation'
require 'lib/svg'
require 'lib/pattern'

class Chapter < String
  def take_document
    return self if processed?
    html = self.to_html
    html = html.css('.document').children 
    html.css('footer').remove
    replace html.to_s
  end
  def separate_tags
    return self if processed?
    html = self.to_html
    html.css('span.tag').each do |tag| 
      tag.content = tag.content << ?\s 
    end
    replace html.to_s
  end
  def replace_equations
    return self if processed?
    Pattern::tex.each do |pattern|
      gsub!(pattern) do |equation|
        Equation.new(equation).for_html
      end
    end; return self
  end
  def rasterize_vectors
    return self if processed?
    gsub!(Pattern::svg) do |path|
      SVG.new(path).to_png
    end
  end
  def to_html
    Nokogiri::HTML self
  end
  def processed?
    html = self.to_html
    conditions = [ 
      html.css('.document').empty?,
      !(self=~Pattern::tex.first),
      !(self=~Pattern::svg),
      html.css('span.tag').empty? || html.css('span.tag')[0].text.include?(?\s)
    ]; conditions.reduce { |x,y| x and y }
  end
end
