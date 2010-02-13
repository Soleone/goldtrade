# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def render_price(price)
    "%0.2f" % price 
  end
  
  def render_chart(stocks)
    stocks = stocks.reverse
    prices = stocks.collect(&:price)
    price_range = prices.min..prices.max
    chart = GoogleChart::LineChart.new
    chart.title = "Price changes of #{stocks.first.name}"
    chart.scale = price_range
    chart.axes  = {:x => stocks.collect{|s| "#{s.created_at.day}."}, :y => price_range}
    chart.type  = :sparkline
    chart.size  = '400x100'
    chart.data  = prices
    chart.color = '00FF00'
    image_tag(chart.to_url)
  end
end
