class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :intro
      t.text :description
      t.string :license
      t.string :repository

      t.timestamps
    end
  end
end
