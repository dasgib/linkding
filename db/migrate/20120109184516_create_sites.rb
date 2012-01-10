class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :url, unique: true, null: false

      t.timestamps
    end
  end
end
