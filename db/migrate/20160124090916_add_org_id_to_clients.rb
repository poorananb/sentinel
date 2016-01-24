class AddOrgIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :org_id, :integer
  end
end
