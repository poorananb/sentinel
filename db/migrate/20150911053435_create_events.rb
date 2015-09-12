class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :praxis_code
      t.string :event_id
      t.timestamp :occurred_at
      t.string :zipcode
      t.string :country

      t.timestamps null: false
    end
  end
end
