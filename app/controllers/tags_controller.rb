class TagsController < ApplicationController
  def index
    @tag_list = Tag.all
  end
end
