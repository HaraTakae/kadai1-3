class UsersController < ApplicationController
  
  def index
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
  end
  
  def 
  
  # introductionを入れたい
  def user_params_update
    params.require(:user).permit(:image, :name, :introduction)
  end
end
