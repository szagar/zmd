class CreateSplits < ActiveRecord::Migration
  def self.up
    create_table :splits do |t|
      t.integer :asset_id
      t.datetime :cax_date
      t.string :terms
      t.timestamps
    end
  end

  def self.down
    drop_table :splits
  end
end
