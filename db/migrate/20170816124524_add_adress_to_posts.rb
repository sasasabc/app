class AddAdressToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :adress, :text
  end
end
