class AddDraftToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :draft, :boolean, default: true
  end
end
