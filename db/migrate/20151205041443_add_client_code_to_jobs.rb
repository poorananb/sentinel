class AddClientCodeToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :client_code, :string
  end
end
