class CreateFundamentals < ActiveRecord::Migration
  def self.up
    create_table :fundamentals do |t|
      t.integer :asset_id
      t.string :sector
      t.string :industry
      t.decimal :pe
      t.decimal :eps
      t.decimal :div_yield
      t.decimal :shares
      t.decimal :dps
      t.decimal :peg
      t.decimal :p2s
      t.decimal :p2b
      t.timestamps
    end
  end

  def self.down
    drop_table :fundamentals
  end
end
