module Pattern
  def self.tex
    [/\\begin{equation\*?}.*?\\end{equation\*?}/m,
     /\\begin{align(at)?\*?}.*?\\end{align(at)?\*?}/m,
     /\$+.*?\$+/m]
  end
  def self.svg
    /(?<=src=").+\.svg(?=">)/
  end
end
