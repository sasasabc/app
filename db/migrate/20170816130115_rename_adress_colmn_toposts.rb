class RenameAdressColmnToposts < ActiveRecord::Migration[5.1]
  def change
  	rename_column :posts, :adress, :address
  end
end
