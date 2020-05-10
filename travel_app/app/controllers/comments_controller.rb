class CommentsController < ApplicationController
	def create
		travel_image = TravelImage.find(params[:travel_image_id])
		comment = current_user.comments.new(comment_params)
		comment.travel_image_id = travel_image.id
		comment.save
		redirect_to travel_image_path(travel_image)
	end
	def destroy
		comment = Comment.find(params[:travel_image_id])
    	travel_image = comment.travel_image
    	if comment.user != current_user
      	   redirect_to request.referer
    	end
    	comment.destroy
	end
	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
