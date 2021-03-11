class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(plot_id: params[:plot_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(plot_id: params[:plot_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
