class CommentsController < ApplicationController
  def create
    @thread_forum = ThreadForum.find(params[:thread_forum_id])
    @comment = @thread_forum.comments.create(params[:comment])
    redirect_to thread_forum_path(@thread_forum)
  end
  def destroy
    @thread_forum = ThreadForum.find(params[:thread_forum_id])
    @comment = @thread_forum.comments.find(params[:id])
    @comment.destroy
    redirect_to thread_forum_path(@thread_forum)
  end
end
