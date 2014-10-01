class ChangeColomnTypeComments < ActiveRecord::Migration
  def up
    change_column :comments, :author, :string
  end

  def down
    change_column :comments, :author, :integer
  end
end
