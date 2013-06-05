class RenameAdmintoCommissioner < ActiveRecord::Migration
  def up
      rename_column :users, :admin, :commissioner
  end

  def down
  end
end
