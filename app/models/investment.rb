class Investment < ActiveRecord::Base
  validates_numericality_of :amount, :minumum => 0

  before_save :save_current_stock
  
    
  def stocks
    Stock.find_all_by_name(name)
  end
  
  private
  
  def save_current_stock
    Stock.create(:name => name)
  end
end