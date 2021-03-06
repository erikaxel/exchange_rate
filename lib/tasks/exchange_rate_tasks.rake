desc "Update exchange rate"
task :update_exchange_rate => :environment do
  puts "Updating exchange rate"
  Money.default_bank = EuCentralBank.new
  Money.default_bank.update_rates

  current = ExchangeRate::Rate.find_by_rate_date(Date.today)
  if current.nil?
    current = ExchangeRate::Rate.new
    current.rate_date = Date.today
  end
  current.eur = Money.default_bank.exchange(10000, "EUR", "NOK").cents / 10000.0
  current.usd = Money.default_bank.exchange(10000, "USD", "NOK").cents / 10000.0
  current.save!
end