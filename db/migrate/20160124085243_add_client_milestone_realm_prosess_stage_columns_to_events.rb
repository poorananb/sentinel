class AddClientMilestoneRealmProsessStageColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :client_code, :string
    add_column :events, :milestone_key, :string
    add_column :events, :realm_code, :string
    add_column :events, :prosess_code, :string
    add_column :events, :stage_code, :string
    add_column :events, :sequence, :integer
  end
end
