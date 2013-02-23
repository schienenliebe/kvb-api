class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :agency_id, null: false
      t.string :short_name, null: false
      t.string :long_name, null: false
      t.text :desc
      t.integer :route_type, null: false
      t.string :url
      t.string :color
      t.string :text_color

      t.timestamps
    end
  end
end
