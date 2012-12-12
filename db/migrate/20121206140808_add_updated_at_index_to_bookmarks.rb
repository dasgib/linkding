class AddUpdatedAtIndexToBookmarks < ActiveRecord::Migration
  def change
    add_index :bookmarks, :updated_at
  end
end
