class AddNameToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :name, :string
  end
end
