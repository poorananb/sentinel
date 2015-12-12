class ChangeIndexCriticalColumnToString < ActiveRecord::Migration
  def change
    change_column :indices, :critical, :string
  end
end
