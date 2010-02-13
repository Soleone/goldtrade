# t.string   "name"
# t.integer  "price"
class Stock < ActiveRecord::Base
  ALL = { 'gold' => 'xauusd' }

  before_save :set_current_stock_price

  default_scope :order => 'created_at DESC'
  
  def self.create_current_prices
    ALL.each do |name, symbol|
      Stock.create(:name => name)
    end
  end
  
  def self.current_price(name)
    name ||= 'Gold'
    YahooStock.get(ALL[name.downcase])
  end
  
  def symbol
    ALL[name.downcase].to_sym
  end
  
  def price
    attributes['price'] / 100.0
  end
  
  def price=(value)
    super((value * 100).round)
  end
  
  private
  
  def set_current_stock_price
    self.price = YahooStock.get(symbol)
  end
end
