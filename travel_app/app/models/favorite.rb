class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :travel_image
end
