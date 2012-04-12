class AddCreatedAtIndexToBookmarks < ActiveRecord::Migration
  def change
    add_index :bookmarks, :created_at
  end
end
