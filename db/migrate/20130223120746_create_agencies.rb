class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :timezone, null: false
      t.string :lang
      t.string :phone
      t.string :fare_url
      t.timestamps
    end
  end
end
