class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
  	@travel_images = @user.travel_images
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  def index
    @user = current_user
    @users = User.all
  end

  def followed
      @user  = User.find(params[:id])
      @users = @user.followed
      render 'show_follow'
  end

  def follower
    @user  = User.find(params[:id])
    @users = @user.follower
    render 'show_follower'
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image)
  end

end
