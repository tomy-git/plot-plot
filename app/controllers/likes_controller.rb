class LikesController < ApplicationController
  def create
    @plot = Plot.find(params[:plot_id])
    like = @plot.likes.new(user_id: current_user.id)
    # like = current_user.likes.create(plot_id: params[:plot_id])
    like.save
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @plot = Plot.find(params[:plot_id])
    like = @plot.likes.find_by(user_id: current_user.id)
    # like = Like.find_by(plot_id: params[:plot_id], user_id: current_user.id)
    like.destroy
    # redirect_back(fallback_location: root_path)
  end
end
