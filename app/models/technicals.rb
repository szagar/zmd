class Technicals < ActiveRecord::Base
  attr_accessible :asset_id, :previous, :change, :volume_change, :Week_high, :Week_low, :Week_change, :avg_week_change, :avg_week_volume, :month_high, :month_low, :month-change, :avg_month-change, :avg_month_volume, :year_high, :year_low, :year_change, :avg_year_change, :avg_year_volume, :ma5, :ma20, :ma50, :ma100, :ma200, :rsi14, :sto9, :wpr14, :mtm14, :roc14, :ptc
end
