$:.unshift(File.join File.dirname(__FILE__), '..')

require 'nokogiri'
require 'lib/equation'
require 'lib/svg'
require 'lib/pattern'

class Chapter < String
  def take_document
    html = self.to_html.css('.document').children
    html.css('footer').remove
    self.replace html.to_html
  end
  def separate_tags
    html = self.to_html
    html.css('span.tag').each do |tag| 
      tag.content = tag.content << ?\s 
    end
    self.replace html.to_html
  end
  def replace_equations
    Pattern::tex.each do |pattern|
      gsub!(pattern) do |equation|
        Equation.new(equation).for_html
      end
    end
    return self
  end
  def rasterize_vectors
    gsub!(Pattern::svg) do |path|
      SVG.new(path).to_png
    end
  end
  def to_html
    Nokogiri::HTML self
  end
end
