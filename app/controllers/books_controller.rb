class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.new
    @user = current_user
    @users = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book.id)
    else
     render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to book_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
     redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
     redirect_to books_path
    end
  end

end
