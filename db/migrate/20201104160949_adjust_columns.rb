class AdjustColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :outcrops, :project_id, :integer
    add_column :outcrops, :user_id, :integer
    remove_column :projects, :outcrop_id
    remove_column :users, :outcrop_id
  end
end
