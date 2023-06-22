class Api::PostsController < ApplicationController
  def index
    posts = current_user.post
    render json: posts
  end
end
