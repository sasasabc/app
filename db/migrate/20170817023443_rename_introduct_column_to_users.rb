class RenameIntroductColumnToUsers < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :introduct, :introduction
  end
end
