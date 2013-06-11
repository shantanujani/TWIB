class AddColumnsToBets < ActiveRecord::Migration
  def change
  add_column :bets, :game_id, :integer
  add_column :bets, :user_id, :integer
  add_column :bets, :home_bets_placed, :integer
  add_column :bets, :away_bets_placed, :integer
  add_column :bets, :home_bets_awarded, :integer
  add_column :bets, :away_bets_awarded, :integer
end
end
