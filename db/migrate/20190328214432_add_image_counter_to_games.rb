class AddImageCounterToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :imageCounter, :integer
  end
end
