class PlotsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_check, only: [:edit, :destroy, :update]

  def index
    @plots = Plot.all
    @tag_list = Tag.all
    @plot = current_user.plots.new
    @all_ranks = Plot.find(Like.group(:plot_id).order('count(plot_id)desc').limit(3).pluck(:plot_id))
  end

  def show
    @plot = Plot.find(params[:id])
    @user = @plot.user
    @plot_tags = @plot.tags
    @comment = Comment.new
    @comments = @plot.comments.order(created_at: :desc)
  end

  def new
    @plot = Plot.new
  end

  def create
    @plot = Plot.new(plot_params)
    @plot.user_id = current_user.id
    tag_list = params[:plot][:tag_name].split(nil)
    if @plot.save
      @plot.save_tag(tag_list)
      redirect_to plot_path(@plot)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @plot = Plot.find(params[:id])
    @plot_tags = @plot.tags.pluck(:tag_name).split(nil)
    # @plot_tag = Tag.where(id: tagmap{ |tag_name| tag.id })
  end

  def update
    @plot = Plot.find(params[:id])
    @plot.update(plot_params)
    tag_list = params[:plot][:tag_name].split(nil)
    if @plot.update_attributes(plot_params)
      @plot.save_tag(tag_list)
      redirect_to plot_path(@plot.id)
    else
      redirect_back(fallback_location: root_path)
    end
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

  # 実行者＝投稿者であることを確認して編集・削除を許可
  def user_check
    unless Plot.find(params[:id]).user.id.to_i == current_user.id
      redirect_to plots_path
    end
  end
end