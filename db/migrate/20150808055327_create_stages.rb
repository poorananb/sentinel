class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.string :code, limit: 20
      t.string :name
      t.boolean :critical

      t.timestamps null: false
    end
  end
end
