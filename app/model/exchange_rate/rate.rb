module ExchangeRate
  class Rate < ActiveRecord::Base
    def nok_to_eur(nok_value)
      nok_value / eur
    end

    def eur_to_nok(eur_value)
      eur_value * eur
    end

    scope :rate_close_to, Proc.new { |before = Date.today, limit = 1| where('rate_date <= ?', before).order("rate_date DESC").limit(limit) }
  end
end
