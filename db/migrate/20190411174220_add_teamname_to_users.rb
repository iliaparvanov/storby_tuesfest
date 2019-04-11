class AddTeamnameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :teamname, :string
    add_index :users, :teamname, unique: true
  end
end
