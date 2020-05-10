class FavoritesController < ApplicationController
	def create
		@travel_image = TravelImage.find(params[:travel_image_id])
		#favorite = current_user.favorites.new(travel_image_id: travel_image.id)
		favorite = current_user.favorites.new(travel_image_id: params[:travel_image_id])
		favorite.save
		#redirect_to travel_image_path(travel_image)
	end
	def destroy
		@travel_image = TravelImage.find(params[:travel_image_id])
		favorite = current_user.favorites.find_by(travel_image_id: params[:travel_image_id], user_id: current_user.id)
		favorite.destroy
		#redirect_to travel_image_path(travel_image)
	end
end
