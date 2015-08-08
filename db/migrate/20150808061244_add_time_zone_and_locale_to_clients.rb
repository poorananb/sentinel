class AddTimeZoneAndLocaleToClients < ActiveRecord::Migration
  def change
    add_column :clients, :timezone, :string
    add_column :clients, :locale, :string
  end
end
