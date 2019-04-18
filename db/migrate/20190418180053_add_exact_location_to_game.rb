class AddExactLocationToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :exact_location, :string
  end
end
