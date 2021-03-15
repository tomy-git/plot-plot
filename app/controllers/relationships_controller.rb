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
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    # current_user.unfollow(params[:id])
    # render :destroy
  end
end
