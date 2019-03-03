class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :text
      t.boolean :recommended
      t.references :game
      t.references :user

      t.timestamps
    end
  end
end
