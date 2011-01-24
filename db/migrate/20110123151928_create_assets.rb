class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :exchange_code
      t.string :symbol
      t.integer :asset_type_id
      t.string :desc
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
