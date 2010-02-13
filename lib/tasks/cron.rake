task :cron => :environment do
  if Time.now.hour == 0 # run at midnight
    puts "Updating current prices for all stocks..."

    Stock.update_all_prices

    puts "...done"
  end
end