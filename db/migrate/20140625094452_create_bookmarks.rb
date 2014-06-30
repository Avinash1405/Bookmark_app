class CreateBookmarks < ActiveRecord::Migration
  def up
    create_table :bookmarks do |t|
    	t.belongs_to :user
    	t.string :title
    	t.string :description
    	t.string :url
    	t.integer :votes,:default => 0
      t.timestamps
    end
  end
  def down
  	drop_table :bookmarks
  end
end
