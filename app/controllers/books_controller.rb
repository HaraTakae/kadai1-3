class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @user = User.new
  end

  def show
  end

  def edit
    
  end

  private
  def books
    params.require(:book).permit(:image, :Title, :Opinion)
  end
end
