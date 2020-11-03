class CreateOutcrops < ActiveRecord::Migration[6.0]
  def change
    create_table :outcrops do |t|
      t.string :location
      t.text :description
      t.decimal :latitude, {:precision => 10, :scale => 6}
      t.decimal :longitude, {:precision => 10, :scale => 6}
      t.timestamps
    end
  end
end
