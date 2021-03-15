class CommentsController < ApplicationController
  def create
    @plot = Plot.find(params[:plot_id])
    @comment = @plot.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :plot_id, :user_id)
  end
end
