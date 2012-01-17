class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.references :user

      t.timestamps
    end
    add_index :imports, :user_id
    add_foreign_key :imports, :users
  end
end
