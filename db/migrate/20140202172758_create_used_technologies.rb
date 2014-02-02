class CreateUsedTechnologies < ActiveRecord::Migration
  def change
    create_table :used_technologies do |t|
      t.references :project, index: true
      t.references :technology, index: true
      t.integer :sort_order, default: 0

      t.timestamps
    end
  end
end
