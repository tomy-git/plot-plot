class RelationshipsController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    redirect_to user_path(@user)
  end
end
