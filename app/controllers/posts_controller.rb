class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.where(author_id: params[:user_id], id: params[:id]).first
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(author:current_user, post_param)
    if @post.save
      redirect @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def post_param
    params.require(:post).permit(:title, :text)
  end
end
