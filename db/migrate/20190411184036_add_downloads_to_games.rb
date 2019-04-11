class AddDownloadsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :downloads, :integer, default: 0
  end
end
