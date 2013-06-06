class ChangeCommissionerFormatInUsers < ActiveRecord::Migration
  def change
    change_column :users, :commissioner, :string

  end
end
