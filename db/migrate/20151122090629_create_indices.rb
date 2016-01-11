class CreateIndices < ActiveRecord::Migration
  def change
    create_table :indices do |t|
      t.string :job_code
      t.string :client_code
      t.string :realm_code
      t.string :cron
      t.boolean :critical
      t.string :notify
      t.string :jobkey
      t.integer :run_length
      t.string :success_step

      t.timestamps null: false
    end
  end
end
