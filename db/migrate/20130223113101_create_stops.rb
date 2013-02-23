class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.integer :agency_stop_id, null: false
      t.integer :agency_id, null: false
      t.string :code
      t.string :name, null: false
      t.text :desc
      t.float :lat, null: false
      t.float :lon, null: false
      t.integer :zone_id
      t.string :url
      t.integer :location_type
      t.integer :parent_station
      t.string :timezone
      t.integer :wheelchair_boarding
      t.timestamps
    end
  end
end
