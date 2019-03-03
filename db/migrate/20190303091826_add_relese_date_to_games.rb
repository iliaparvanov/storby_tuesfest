class AddReleseDateToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :relese_date, :date
  end
end
