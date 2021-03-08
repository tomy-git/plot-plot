class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdrew
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :icon)
  end
end
