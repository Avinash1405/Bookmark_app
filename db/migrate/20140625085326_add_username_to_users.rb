class AddUsernameToUsers < ActiveRecord::Migration
  def up
    add_column :users, :username, :string
  end
  def down
  	change_table :users do|t|
	t.remove :username
	end
  end
end
