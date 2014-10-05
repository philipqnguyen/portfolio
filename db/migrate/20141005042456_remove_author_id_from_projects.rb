class RemoveAuthorIdFromProjects < ActiveRecord::Migration
  def change
    remove_reference :projects, :author_id, index: true
  end
end
