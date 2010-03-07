class Investment < ActiveRecord::Base
  validates_numericality_of :amount, :minumum => 0

  before_save :save_current_stock
  
  def amount_in_dollars
    "%0.2f" % (amount * current_price)
  end
  
  def amount_in_dollars=(dollars)
    self.amount = (dollars.to_f / current_price).floor
  end
  
  def stocks
    @stocks ||= Stock.find_all_by_name(name)
  end
  
  def current_price
    @current_price ||= Stock.current_price(name)
  end
  
  def original_price
    @original_price ||= begin
      original_stock = Stock.all.find{|s| s.created_at.to_date == created_at.to_date}
      original_stock.price
    end
  end
  
  def cache_key
    stocks.size
  end
  
  def max
    stocks.max{|a,b| a.price <=> b.price }
  end

  def min
    stocks.min{|a,b| a.price <=> b.price }
  end
  
  private
  
  def save_current_stock
    Stock.create(:name => name)
  end
end