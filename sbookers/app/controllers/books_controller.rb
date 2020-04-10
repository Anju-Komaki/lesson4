class BooksController < ApplicationController
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to books_path
	end
	def index
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
        flash[:message] = "Book was successfully updated"
        redirect_to book_path(@book)
     else
      render :edit
     end
	end
	private
	def book_params
		params.require(:book).permit(:title, :opinion)
	end
end
