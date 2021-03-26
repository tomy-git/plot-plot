class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @plot = Plot.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  # def followed
  #   @user = User.find(params[:id])
  #   @users = @user.followed
  #   render 'relationships/index'
  # end

  # def followers
  #   @user = User.find(params[:id])
  #   @users = @user.followers
  #   render 'relationships/show'
  # end

  def hide
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :icon)
  end
end
