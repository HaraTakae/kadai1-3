class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @home = @user.home
  end

  def edit
  end
  
  # introductionを入れたい
  def user_params_update
    params.require(:user).permit(:image, :name, :introduction)
  end
end
