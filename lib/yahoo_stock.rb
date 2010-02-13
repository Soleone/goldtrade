require 'open-uri'

module YahooStock
  URL = "http://finance.yahoo.com/q?s="
  
  def self.get(symbol = :xauusd)
    doc = Hpricot(open("#{URL}#{symbol}"))
    element = "yfs_l10_#{symbol}=x"
    prices = doc/"span[@id='#{element}']"
    prices.first.inner_html.gsub(',', '_').to_f
  end
end