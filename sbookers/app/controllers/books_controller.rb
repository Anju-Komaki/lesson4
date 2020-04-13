class BooksController < ApplicationController
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to book_path(@book)
	end
	def new
		@book = Book.new
		@books = Book.all
	end
	def show
		@book = Book.find(params[:id])
	end
	def edit
		@book = Book.find(params[:id])
	end
	def update
	    @book = Book.find(params[:id])
	 if @book.update(book_params)
        flash[:message] = "You have updated book successfully."
        redirect_to book_path(@book)
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
		params.require(:book).permit(:title, :body)
	end
end
