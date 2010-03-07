require 'test_helper'

class StockTest < ActiveSupport::TestCase

  test "set symbol before_save" do
    stock = Stock.create(:name => 'Gold')
    assert_equal :xauusd, stock.symbol
  end
  
  test "create new Stocks for with create_current_prices" do
    assert_difference "Stock.count", 1 do
      Stock.create_current_prices
    end
  end
end
