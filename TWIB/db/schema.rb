# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130613045450) do

  create_table "bets", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "home_bets_placed"
    t.integer  "away_bets_placed"
    t.integer  "home_bets_awarded"
    t.integer  "away_bets_awarded"
  end

  create_table "games", :force => true do |t|
    t.integer "home_team_id"
    t.integer "visiting_team_id"
    t.float   "line"
    t.string  "home_team_result"
  end

  create_table "teams", :force => true do |t|
    t.string "team_name"
    t.string "conference"
    t.string "division"
  end

  create_table "units", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "commissioner"
  end

end
