class AddDownloadUrlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :download_url, :string
  end
end
