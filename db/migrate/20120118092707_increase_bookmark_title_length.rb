class IncreaseBookmarkTitleLength < ActiveRecord::Migration
  def up
    change_column :bookmarks, :title, :string, null: false, limit: 1024
  end

  def down
    change_column :bookmarks, :title, :string, null: false, limit: 255
  end
end
