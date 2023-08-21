class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def index
    @book = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def create
    book = Book.find(params[:user_id])
    book.save
     redirect_to book_path(@book.id)
  end

  def update
    @book = Book.find(params[:id])
    unless @book.id == current_book.id
      redirect_to books_path(@book.id)
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(@book.id)
  end
  
  
  private

  def book_params
    params.require(:book).permit(:image, :Title, :Opinion)
  end

  def is_matching_login_user
    @book = Book.find(params[:id])
    unless @book.id == current_book.id
      redirect_to books_path
    end
  end

end
