class LikesController < ApplicationController
  def create
    @plot = Plot.find(params[:plot_id])
    like = @plot.likes.new(user_id: current_user.id)
    like.save
  end

  def destroy
    @plot = Plot.find(params[:plot_id])
    like = @plot.likes.find_by(user_id: current_user.id)
    like.destroy
  end
end
