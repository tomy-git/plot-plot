class PlotsController < ApplicationController
  before_action :authenticate_user!
  def index
    @plots = Plot.all
  end

  def show
    @plot = Plot.find(params[:id])
  end

  def new
    @plot = Plot.new
  end

  def create
    @plot = Plot.new(plot_params)
    @plot.user_id = current_user.id
    @plot.save
    redirect_to plot_path(@plot)
  end

  def edit
    @plot = Plot.find(params[:id])
  end

  def update
    @plot = Plot.find(params[:id])
    @plot.update(plot_params)
    redirect_to plot_path(@plot.id)
  end

  def destroy
    @plot = Plot.find(params[:id])
    @plot.destroy
    redirect_to plots_path
  end

  private
  def plot_params
    params.require(:plot).permit(:title, :body)
  end
end
