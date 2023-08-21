class UsersController < ApplicationController
 before_action :is_matching_login_user, only: [:edit, :update]


  def index
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user =  User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
     redirect_to user_path(@user.id)
    else
     render :edit
    end
  end

  # introductionを入れたい
  def user_params_update
    params.require(:user).permit(:image, :name, :introduction)
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

  def is_matching_login_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to book_path
    end
  end
end
