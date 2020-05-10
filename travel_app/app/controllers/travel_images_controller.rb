class TravelImagesController < ApplicationController
 before_action :authenticate_user!
	def new
		@travel_image = TravelImage.new
	end

	def create
		@travel_image = TravelImage.new(travel_image_params)
		@travel_image.user_id = current_user.id
		if @travel_image.save
		   redirect_to travel_images_path
	    else
	       render :new
	    end
	end

	def index
		@travel_images = TravelImage.all
	end

	def show
		@travel_image = TravelImage.find(params[:id])
		@comment = Comment.new
		@user = @travel_image.user
	end

	def edit
		@travel_image = TravelImage.find(params[:id])
		if @travel_image.user != current_user
			redirect_to travel_images_path
		end
	end

	def destroy
		@travel_image = TravelImage.find(params[:id])
		@travel_image.destroy
		redirect_to travel_images_path
	end


	private
	def travel_image_params
		params.require(:travel_image).permit(:image, :caption)
	end
end
