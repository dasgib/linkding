class AddSearchIndexToBookmarks < ActiveRecord::Migration
  def up
    execute "CREATE INDEX bookmarks_search_idx ON bookmarks USING gin((to_tsvector('english', title) || to_tsvector('english', coalesce(description, '')) || to_tsvector('english', array_to_string(tag_array, ' '))));"
  end

  def down
    execute "DROP INDEX bookmarks_search_idx"
  end
end
