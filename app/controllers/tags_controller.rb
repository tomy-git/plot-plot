class TagsController < ApplicationController
  def index
    @tag_list = Tag.all
  end

  def show
    @tag_list = Tag.all
    @tag = Tag.find(params[:id])
    @plots = @tag.plots.all
  end

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @plots = @tag.plots.all
  end
end
