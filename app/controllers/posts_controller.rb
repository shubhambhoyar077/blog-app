class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    puts @posts
  end

  def show; end
end
