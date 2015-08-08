class CreatePraxis < ActiveRecord::Migration
  def change
    create_table :praxis do |t|
      t.string :praxis_code
      t.string :org_code
      t.string :client_code
      t.string :realm_code
      t.string :prosess_code
      t.string :stage_code
      t.integer :sequence
      t.integer :sla
      t.integer :tolerance_percentage
      t.boolean :critical

      t.timestamps null: false
    end
  end
end
