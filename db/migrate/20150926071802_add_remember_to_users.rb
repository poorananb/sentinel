class AddRememberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember, :string
  end
end
