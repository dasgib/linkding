class IncreaseSiteUrlLength < ActiveRecord::Migration
  def up
    change_column :sites, :url, :string, null: false, limit: 2048
  end

  def down
    change_column :sites, :url, :string, null: false, limit: 255
  end
end
