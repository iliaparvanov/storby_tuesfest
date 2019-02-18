class Game < ApplicationRecord
	validates_presence_of :name, :price, :source
	has_many_attached :source
end
