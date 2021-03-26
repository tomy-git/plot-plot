class HomesController < ApplicationController
  def top
    @all_ranks = Plot.find(Like.group(:plot_id).order('count(plot_id)desc').limit(3).pluck(:plot_id))
  end

  def about
  end
end
