class AddExchangeRateRate < ActiveRecord::Migration
  def change
    create_table :exchange_rate_rates do |t|
      t.date :rate_date
      t.decimal :eur, :precision => 9, :scale => 6
      t.decimal :usd, :precision => 9, :scale => 6
      t.timestamps
    end

    add_index "exchange_rate_rates", ["rate_date"], :name => "index_exchange_rates_on_rate_date"
  end
end
