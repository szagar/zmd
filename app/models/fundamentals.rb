class Fundamentals < ActiveRecord::Base
  attr_accessible :asset_id, :sector, :industry, :pe, :eps, :div_yield, :shares, :dps, :peg, :p2s, :p2b
end
