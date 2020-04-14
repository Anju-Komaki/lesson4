class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
       flash[:update] = "You have updated user successfully."
  	   redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  def index
    @user = current_user
  	@users = User.all
    @books = @user.books
  end
  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
