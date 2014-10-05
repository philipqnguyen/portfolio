class AddAuthorIdToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :author_id, index: true
  end
end
