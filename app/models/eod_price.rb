class EodPrice < ActiveRecord::Base
  attr_accessible :asset_id, :mark_date, :open_px, :high_px, :low_px, :close_px, :volume, :open_interest
end
