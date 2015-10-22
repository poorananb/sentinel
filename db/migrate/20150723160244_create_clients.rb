class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :code, limit: 10
      t.string :name
      t.string :org_code
      t.timestamps null: false
    end
  end
end
