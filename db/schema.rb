# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110123155304) do

  create_table "asset_types", :force => true do |t|
    t.string   "short_name"
    t.string   "long_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", :force => true do |t|
    t.string   "exchange_code"
    t.string   "symbol"
    t.integer  "asset_type_id"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eod_prices", :force => true do |t|
    t.integer  "asset_id"
    t.datetime "mark_date"
    t.decimal  "open_px",       :precision => 10, :scale => 0
    t.decimal  "high_px",       :precision => 10, :scale => 0
    t.decimal  "low_px",        :precision => 10, :scale => 0
    t.decimal  "close_px",      :precision => 10, :scale => 0
    t.decimal  "volume",        :precision => 10, :scale => 0
    t.decimal  "open_interest", :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exchanges", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.boolean  "load_issues"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fundamentals", :force => true do |t|
    t.integer  "asset_id"
    t.string   "sector"
    t.string   "industry"
    t.decimal  "pe",         :precision => 10, :scale => 0
    t.decimal  "eps",        :precision => 10, :scale => 0
    t.decimal  "div_yield",  :precision => 10, :scale => 0
    t.decimal  "shares",     :precision => 10, :scale => 0
    t.decimal  "dps",        :precision => 10, :scale => 0
    t.decimal  "peg",        :precision => 10, :scale => 0
    t.decimal  "p2s",        :precision => 10, :scale => 0
    t.decimal  "p2b",        :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "splits", :force => true do |t|
    t.integer  "asset_id"
    t.datetime "cax_date"
    t.string   "terms"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technicals", :force => true do |t|
    t.integer  "asset_id"
    t.decimal  "previous",         :precision => 10, :scale => 0
    t.decimal  "change",           :precision => 10, :scale => 0
    t.decimal  "volume_change",    :precision => 10, :scale => 0
    t.decimal  "week_high",        :precision => 10, :scale => 0
    t.decimal  "week_low",         :precision => 10, :scale => 0
    t.decimal  "week_change",      :precision => 10, :scale => 0
    t.decimal  "avg_week_change",  :precision => 10, :scale => 0
    t.decimal  "avg_week_volume",  :precision => 10, :scale => 0
    t.decimal  "month_high",       :precision => 10, :scale => 0
    t.decimal  "month_low",        :precision => 10, :scale => 0
    t.decimal  "month_change",     :precision => 10, :scale => 0
    t.decimal  "avg_month_change", :precision => 10, :scale => 0
    t.decimal  "avg_month_volume", :precision => 10, :scale => 0
    t.decimal  "year_high",        :precision => 10, :scale => 0
    t.decimal  "year_low",         :precision => 10, :scale => 0
    t.decimal  "year_change",      :precision => 10, :scale => 0
    t.decimal  "avg_year_change",  :precision => 10, :scale => 0
    t.decimal  "avg_year_volume",  :precision => 10, :scale => 0
    t.decimal  "ma5",              :precision => 10, :scale => 0
    t.decimal  "ma20",             :precision => 10, :scale => 0
    t.decimal  "ma50",             :precision => 10, :scale => 0
    t.decimal  "ma100",            :precision => 10, :scale => 0
    t.decimal  "ma200",            :precision => 10, :scale => 0
    t.decimal  "rsi14",            :precision => 10, :scale => 0
    t.decimal  "sto9",             :precision => 10, :scale => 0
    t.decimal  "wpr14",            :precision => 10, :scale => 0
    t.decimal  "mtm14",            :precision => 10, :scale => 0
    t.decimal  "roc14",            :precision => 10, :scale => 0
    t.decimal  "ptc",              :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
