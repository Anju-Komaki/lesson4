class BooksController < ApplicationController
 def top
 end
  def list
  	@books = Book.all
  	@book = Book.new
  end

  def show
  end

  def edit
  end
end
