class RelationshipsController < ApplicationController
  def index
  end

  def show
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
