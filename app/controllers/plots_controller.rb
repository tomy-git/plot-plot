class PlotsController < ApplicationController
  before_action :authenticate_user!
  def index
    @plots = Plot.all
    @tag_list = Tag.all
    @plot = current_user.plots.new
  end

  def show
    @plot = Plot.find(params[:id])
    @plot_tags = @plot.tags
  end

  def new
    @plot = Plot.new
  end

  def create
    @plot = Plot.new(plot_params)
    @plot.user_id = current_user.id
    # @plot = current_user.plots.new(plot_params)
    tag_list = params[:plot][:tag_name].split(nil)
    if @plot.save
      @plot.save_tag(tag_list)
      # redirect_back(fallback_location: root_path)
      redirect_to plot_path(@plot)
    else
      redirect_back(fallback_location: root_path)
    end
    # redirect_to plot_path(@plot)
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

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @plots = @tag.plots.all
  end

  private
  def plot_params
    params.require(:plot).permit(:title, :body)
  end
end
