class AddTimeZoneAndLocaleToOrgs < ActiveRecord::Migration
  def change
    add_column :orgs, :timezone, :string
    add_column :orgs, :locale, :string
  end
end
