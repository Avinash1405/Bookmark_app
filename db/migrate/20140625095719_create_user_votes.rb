class CreateUserVotes < ActiveRecord::Migration
  def up
    create_table :user_votes do |t|
    	t.belongs_to :user
    	t.belongs_to :bookmark
      t.timestamps
    end
  end
  def down
  	drop_table :user_votes
  end
end
