class AddCommentToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :comment, :text
  end
end
