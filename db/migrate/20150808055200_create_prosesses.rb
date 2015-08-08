class CreateProsesses < ActiveRecord::Migration
  def change
    create_table :prosesses do |t|
      t.string :code
      t.string :name

      t.timestamps null: false
    end
  end
end
