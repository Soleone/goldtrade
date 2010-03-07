# t.string   "name"
# t.integer  "price"
class Stock < ActiveRecord::Base
  ALL = { 'gold' => 'xauusd' }

  before_save :set_current_stock_price

  default_scope :order => 'created_at DESC'
  
  def self.create_current_prices
    ALL.each do |name, symbol|
      # TODO: why the hell does it need to be capitalized ???
      Stock.create(:name => name.capitalize)
    end
  end
  
  def self.cleanup_duplicates!
    all_dates = Stock.all.collect{|s| s.created_at.to_date}.uniq
    stocks_to_keep = all_dates.map{|d| Stock.find(:first, :conditions => ["DATE(created_at) = ?", d])}
    Stock.destroy_all("not id in (#{stocks_to_keep.collect(&:id).join(',')})")
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

  def validate
    if Time.now.utc.to_date == Stock.first.created_at.to_date
      errors.add_to_base "A Stock for '#{name}' from today already exists in the database, so no additional one will be created until tomorrow!"
    end
  end  
  
  def set_current_stock_price
    self.price = YahooStock.get(symbol)
  end  
end
