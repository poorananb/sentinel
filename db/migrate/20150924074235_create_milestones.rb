class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :org_code
      t.string :client_code
      t.string :key
      t.string :realm_code

      t.timestamps null: false
    end
  end
end
