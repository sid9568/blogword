class AddPostIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :posts_id, :integer
  end
end
