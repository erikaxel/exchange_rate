Money.class_eval do
  def exchange_to_with_date(other_currency, date)
    other_currency = Currency.wrap(other_currency)
    if self.currency == other_currency
      self
    else
      rate = ExchangeRate.rate_close_to(date).first
      @bank.add_rate("EUR", "NOK", rate.eur)
      @bank.add_rate("USD", "NOK", rate.usd)
      @bank.exchange_with(self, other_currency)
    end
  end
end