class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.references :site, null: false
      t.references :user, null: false
      t.string :title, null: false
      t.boolean :public, default: false, null: false

      t.timestamps
    end
    add_index :bookmarks, :site_id
    add_index :bookmarks, :user_id

    add_foreign_key :bookmarks, :sites
    add_foreign_key :bookmarks, :users
  end
end
