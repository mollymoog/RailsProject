class AddOutcropIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :outcrop_id, :integer
  end
end
