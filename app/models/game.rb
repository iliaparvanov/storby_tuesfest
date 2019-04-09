class Game < ApplicationRecord
	has_many :reviews
	validates_presence_of :name, :price, :source
	has_many_attached :source
	has_many_attached :images
	has_and_belongs_to_many :users
end
