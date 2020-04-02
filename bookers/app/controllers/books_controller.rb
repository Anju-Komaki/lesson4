class BooksController < ApplicationController
  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @books = Book.all.order(created_at: :desc)
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)
  	book.save
    redirect_to new_book_path, notice: "Book was successfully created"
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
       flash[:message] = "Book was successfully updated"
       redirect_to book_path
    else
      render :new
    end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to new_book_path, alert: "Book was successfully destoyed."
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
