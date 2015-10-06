class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :org_code
      t.string :client_code
      t.string :key
      t.string :label_name
      t.string:realm_code
      t.string:icon
      t.timestamps null: false
    end
  end
end
