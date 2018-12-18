class CreateLyrics < ActiveRecord::Migration
  def change
    create_table :lyrics do |t|
      t.string :title
      t.integer :artist_id
      t.text :text
      t.string :image
      t.string :url

      t.timestamps null: false
    end
  end
end
