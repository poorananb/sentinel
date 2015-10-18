class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer
    
    # populate the table
    User.create :name => "admin", :email => "admin@example.com", :password => 'admin@123', :role => 1
  end
end
