class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :jobkey
      t.string :runkey
      t.string :stage
      t.string :value

      t.timestamps null: false
    end
  end
end
