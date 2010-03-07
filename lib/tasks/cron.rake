require 'hpricot'
require 'google_chart'

task :cron => :environment do
  puts "Updating current prices for all stocks..."
  Stock.create_current_prices
  puts "...done"
  
  puts "Deleting duplicate stocks for the same day"
  deleted = Stock.cleanup_duplicates!
  puts "...done deleting #{deleted.size} stocks"

  puts "Fixing misnamed (lowercase) stocks"  
  fixed = Stock.find_all_by_name('gold').each do |misnamed_stock|
    misnamed_stock.update_attribute(:name, 'Gold')
  end
  puts "...done fixing #{fixed.size} stocks"
end