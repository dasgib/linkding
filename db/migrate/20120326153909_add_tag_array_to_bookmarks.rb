class AddTagArrayToBookmarks < ActiveRecord::Migration
  def up
    add_column :bookmarks, :tag_array, :string_array
    execute <<-EOS
      UPDATE bookmarks SET tag_array = array(
        SELECT tags.name FROM tags, taggings
        WHERE tag_id = tags.id
          AND taggable_id = bookmarks.id
          AND taggable_type = 'Bookmark');
    EOS
  end

  def down
    remove_column :bookmarks, :tag_array
  end
end
