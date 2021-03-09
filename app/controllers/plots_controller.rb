class PlotsController < ApplicationController
  before_action :authenticate_user!
  def index
    @plots = Plot.all
  end

  def show
  end

  def new
    @plot = Plot.new
  end

  def create
    @plot = Plot.new(plot_params)
    @user = current_user
    @plot.user_id = current_user.id
    @plot.save
    redirect_to plot_path(@plot)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def plot_params
    params.require(:plot).permit(:title, :body)
  end
end
