class CreateTechnicals < ActiveRecord::Migration
  def self.up
    create_table :technicals do |t|
      t.integer :asset_id
      t.decimal :previous
      t.decimal :change
      t.decimal :volume_change
      t.decimal :week_high
      t.decimal :week_low
      t.decimal :week_change
      t.decimal :avg_week_change
      t.decimal :avg_week_volume
      t.decimal :month_high
      t.decimal :month_low
      t.decimal :month_change
      t.decimal :avg_month_change
      t.decimal :avg_month_volume
      t.decimal :year_high
      t.decimal :year_low
      t.decimal :year_change
      t.decimal :avg_year_change
      t.decimal :avg_year_volume
      t.decimal :ma5
      t.decimal :ma20
      t.decimal :ma50
      t.decimal :ma100
      t.decimal :ma200
      t.decimal :rsi14
      t.decimal :sto9
      t.decimal :wpr14
      t.decimal :mtm14
      t.decimal :roc14
      t.decimal :ptc
      t.timestamps
    end
  end

  def self.down
    drop_table :technicals
  end
end
