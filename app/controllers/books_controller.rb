class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def index
    @book = Book.all
    @books = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @users = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    if @book.save
     redirect_to book_path(@book.id)
    else
     render :index
    end
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
    params.require(:book).permit(:title, :opinion)
  end

  def is_matching_login_user
    @book = Book.find(params[:id])
    unless @book.id == current_book.id
      redirect_to books_path
    end
  end

end
