class CreateCalendarServices < ActiveRecord::Migration
  def change
    create_table :calendar_services do |t|
      t.integer :agency_id, null: false
      t.string  :code, null: false
      t.boolean :monday, null: false
      t.boolean :tuesday, null: false
      t.boolean :wednesday, null: false
      t.boolean :thursday, null: false
      t.boolean :friday, null: false
      t.boolean :saturday, null: false
      t.boolean :sunday, null: false
      t.date :starts_on, null: false
      t.date :ends_on, null: false
      t.timestamps
    end
  end
end
