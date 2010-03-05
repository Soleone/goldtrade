require 'hpricot'
require 'google_chart'

task :cron => :environment do
  puts "Updating current prices for all stocks..."
  Stock.create_current_prices
  puts "...done"
end