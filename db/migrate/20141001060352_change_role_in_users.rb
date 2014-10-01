class ChangeRoleInUsers < ActiveRecord::Migration
  def up
    change_column :users, :role, :string, :default => 'visitor'
  end

  def down
    change_column :users, :role, :string
  end
end
