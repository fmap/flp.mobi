require 'nokogiri'
require 'mime/types'

class OPF
  attr_reader :xml
  def initialize path
    @xml = Nokogiri::XML File.read(path)
  end
  def add_chapter filename
    id, type, href = generics filename
    add_manifest id, type, href
    add_spine id
  end
  def add_image filename
    id, type, href = generics filename
    add_manifest id, type, href
  end
  private
  def generics filename
    id   = filename.delete ?.
    type = MIME::Types.type_for(filename)[0].content_type
    href = filename
    return [id, type, href]
  end
  def add_manifest id, type, href
    item = @xml.create_element 'item', id: id, href: href, 'media-type' => type
    item.parent = @xml.at_css 'manifest'
  end
  def add_spine id
    itemref = @xml.create_element 'itemref', idref: id
    itemref.parent = @xml.at_css 'spine'
  end
end

