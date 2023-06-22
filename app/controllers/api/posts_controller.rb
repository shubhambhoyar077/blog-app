class Api::PostsController < ApplicationController
  def index
    begin
      user = User.find(params[:user_id])
      posts = user.post
      render json: posts
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :not_found
    rescue => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
end
