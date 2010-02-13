# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def render_price(price)
    "%0.2f" % price 
  end
end
