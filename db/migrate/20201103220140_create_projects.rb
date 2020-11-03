class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.text :description
      t.integer :outcrop_id
      t.timestamps
    end
  end
end
