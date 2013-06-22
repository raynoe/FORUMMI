class CommentsController < ApplicationController

  def create
    @thread_forum = ThreadForum.find(params[:thread_forum_id])
    @comment = @thread_forum.comments.new(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment added"
      redirect_to thread_forum_path(@thread_forum)
    else
      flash[:error] = "Error adding comment"
      redirect_to :back
    end
  end

  def destroy
    @thread_forum = ThreadForum.find(params[:thread_forum_id])
    @comment = @thread_forum.comments.find(params[:id])
    @comment.destroy
    redirect_to thread_forum_path(@thread_forum)
  end

end
