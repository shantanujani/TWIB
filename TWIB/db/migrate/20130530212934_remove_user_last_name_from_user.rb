class RemoveUserLastNameFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :user_last_name
  end

  def down
  end
end
