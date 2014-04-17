class RemoveUsernameFromAuthor < ActiveRecord::Migration
  def change
    remove_column :authors, :username, :string
  end
end
