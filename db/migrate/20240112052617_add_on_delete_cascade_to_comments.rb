class AddOnDeleteCascadeToComments < ActiveRecord::Migration[7.1]
  def up
    remove_foreign_key :comments, :posts
    remove_foreign_key :likes, :posts
    add_foreign_key :comments, :posts, on_delete: :cascade
    add_foreign_key :likes, :posts, on_delete: :cascade
  end

  def down
    remove_foreign_key :comments, :posts
    remove_foreign_key :likes, :posts
    add_foreign_key :comments, :posts
    add_foreign_key :likes, :posts
  end
end
