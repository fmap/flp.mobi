module Pattern
  def self.tex
    [/\\begin{equation\*?}.*?\\end{equation\*?}/m,
     /\\begin{align\*?}.*?\\end{align\*?}/m,
     /\$+.*?\$+/m]
  end
  def self.svg
    /(?<=src=").+\.svg(?=">)/
  end
end
