class ChangeApprovedInComments < ActiveRecord::Migration
  def up
    change_column :comments, :approved, :boolean, :default => false
  end

  def down
    change_column :comments, :approved, :boolean
  end
end
