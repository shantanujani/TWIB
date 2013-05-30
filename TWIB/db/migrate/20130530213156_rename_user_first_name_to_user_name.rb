class RenameUserFirstNameToUserName < ActiveRecord::Migration
  def up
    rename_column :users, :user_first_name, :username
  end

  def down
  end
end
