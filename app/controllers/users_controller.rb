class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def followed
    @user = User.find(params[:id])
    @users = @user.followed
    render 'relationships/index'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'relationships/show'
  end

  def hide
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "ご利用ありがとうございました。"
    redirect_to root_path
  end

  def withdrew
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :icon)
  end
end
