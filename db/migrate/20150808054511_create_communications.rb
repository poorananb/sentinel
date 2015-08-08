class CreateCommunications < ActiveRecord::Migration
  def change
    create_table :communications do |t|
      t.string :org_code, limit: 20
      t.string :client_code, limit: 20
      t.string :primary_email
      t.string :secondary_email
      t.string :primary_phone
      t.string :secondary_phone

      t.timestamps null: false
    end
  end
end
