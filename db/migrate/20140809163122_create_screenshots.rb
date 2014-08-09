class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.string :caption
      t.string :image
      t.integer :sort_order
      t.integer :project_id

      t.timestamps
    end
  end
end
