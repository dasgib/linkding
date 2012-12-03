class AddIndexOnTaggableIdToTaggings < ActiveRecord::Migration
  def change
    add_index :taggings, :taggable_id
  end
end
