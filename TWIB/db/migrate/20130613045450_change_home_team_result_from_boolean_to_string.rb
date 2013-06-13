class ChangeHomeTeamResultFromBooleanToString < ActiveRecord::Migration
  def change
    change_column :games, :home_team_result, :string
  end
end
