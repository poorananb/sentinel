class RemoveClientCodeFromIndices < ActiveRecord::Migration
  def change
    remove_column :indices, :client_code, :string
  end
end
