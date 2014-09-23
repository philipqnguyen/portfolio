class ChangeImageUrlInProjects < ActiveRecord::Migration
  def change
    change_column :projects, :image_url, :text
  end
end
