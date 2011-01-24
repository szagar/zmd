class CreateEodPrices < ActiveRecord::Migration
  def self.up
    create_table :eod_prices do |t|
      t.integer :asset_id
      t.datetime :mark_date
      t.decimal :open_px
      t.decimal :high_px
      t.decimal :low_px
      t.decimal :close_px
      t.decimal :volume
      t.decimal :open_interest
      t.timestamps
    end
  end

  def self.down
    drop_table :eod_prices
  end
end
