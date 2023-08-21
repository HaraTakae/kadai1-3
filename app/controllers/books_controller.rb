class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

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
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    unless @book.id == current_book.id
      redirect_to books_path(@book.id)
    end
  end

  private

  def books
    params.require(:book).permit(:image, :Title, :Opinion)
  end

  def is_matching_login_user
    @book = Book.find(params[:id])
    unless @book.id == current_book.id
      redirect_to books_path
    end
  end

end
