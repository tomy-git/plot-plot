class RelationshipsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    # current_user.follow(params[:id])
    # render :create
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    # current_user.unfollow(params[:id])
    # render :destroy
    redirect_to user_path(@user)
  end
end
