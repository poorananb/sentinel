class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :org_code
      t.string :job_code
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
