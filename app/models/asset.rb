class Asset < ActiveRecord::Base
  attr_accessible :exchange_code, :symbol, :asset_type_id, :desc
end
