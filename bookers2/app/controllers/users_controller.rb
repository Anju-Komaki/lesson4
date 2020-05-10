class UsersController < ApplicationController
  before_action :authenticate_user! ,only: [:index, :show, :edit, :update]
  before_action :correct_user ,only: [:edit, :update]

  def show
  	@user = User.find(params[:id])
  	@books = @user.books.all
    @book = Book.new
  end
  def edit
  	@user = User.find(current_user.id)
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
    @user = User.find(current_user.id)
    @book = Book.new
  	@users = User.all
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def correct_user
    @user = User.find(params[:id])
        if @user != current_user
          redirect_to user_path(current_user.id)
        end
  end
end
