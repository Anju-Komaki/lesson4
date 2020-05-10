class BooksController < ApplicationController
  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @books = Book.all
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
      flash[:success] = "Book was successfully created"
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :new
    end
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