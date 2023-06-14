class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comment.new(author: current_user, **comment_param)
    if @comment.save
      redirect_to @comment
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def comment_param
    params.require(:comment).permit(:text)
  end
end
