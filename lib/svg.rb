class SVG < String
  def to_png
    res = sub(/svg$/,'png')
    opts = '-density 120 +antialias -background none'
    system ['convert', opts, self, res].join(?\s)
    return res
  end
end
