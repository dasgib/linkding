class AddTagArrayToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :tag_array, :string_array
  end
end
