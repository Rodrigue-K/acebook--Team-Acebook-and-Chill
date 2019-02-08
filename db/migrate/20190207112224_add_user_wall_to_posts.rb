class AddUserWallToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :user_wall, :string
  end
end
