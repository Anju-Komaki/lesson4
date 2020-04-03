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
  	@book = Book.new(book_params)
  	if @book.save
      flash[:success] = "Book was successfully created"
      redirect_to show_book_path(@book)
    else
      @books = Book.all.order(created_at: :desc)
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
       flash[:message] = "Book was successfully updated"
       redirect_to show_book_path(book.id)
    else
      render :new
    end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, alert: "Book was successfully destoyed."
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
