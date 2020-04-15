class BooksController < ApplicationController
 before_action :authenticate_user!
	def create
		@book = Book.new(book_params)
		@user = User.find(current_user.id)
		@book.user_id = current_user.id
	 if @book.save
	 	flash[:message] = "You have creatad book successfully."
		redirect_to book_path(@book.id)
     else
     	@books = Book.all
	    render action: :index
     end
	end

	def index
		@user = current_user
		@books = Book.all
		@book = Book.new
	end

	def show
		@book = Book.find(params[:id])
		@user = User.find_by(id: @book.user_id)
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user != current_user
			redirect_to books_path
		end
	end

	def update
	    @book = Book.find(params[:id])
	 if @book.update(book_params)
        flash[:message] = "You have updated book successfully."
        redirect_to book_path(@book.id)
     else
      render :edit
     end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to new_book_path
	end
	private
	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end
end
