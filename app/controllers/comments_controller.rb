class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    post = Post.find(params[:post_id])
    @comment = post.comment.new(author: current_user, **comment_params)
    if @comment.save
      redirect_to user_post_path(post.author, post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
