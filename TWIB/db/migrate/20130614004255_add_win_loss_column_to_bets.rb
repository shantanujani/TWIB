class AddWinLossColumnToBets < ActiveRecord::Migration
  def change
    add_column :bets, :result, :string, :default => ""
  end
end
