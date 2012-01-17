class AddImportToBookmark < ActiveRecord::Migration
  def change
    add_column :bookmarks, :import_id, :integer
    add_index :bookmarks, :import_id
    add_foreign_key :bookmarks, :imports
  end
end
