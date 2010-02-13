require 'test_helper'

class InvestmentTest < ActiveSupport::TestCase
  def setup
    @gold = Investment.new(:name => 'Gold')
  end

  test "amount defaults to 1" do
    assert_equal 1, @gold.amount
  end
  
  test "creates stock after saving" do
    assert_equal 0, @gold.stocks.size
    @gold.save
    assert_equal 1, @gold.stocks.size
    @gold.save
    assert_equal 2, @gold.stocks.size
  end
  
  test "creates stock after saving again" do
    @gold.save
    assert_equal 1, @gold.stocks.size
  end
  
end
