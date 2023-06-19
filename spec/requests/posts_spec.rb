require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    before :all do
      @new_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.')
    end
    it 'should responce with success.' do
      get user_posts_path(@new_user)
      expect(response).to have_http_status(:success)
    end
    it 'should responce with correct status' do
      get user_posts_path(@new_user)
      expect(response.status).to eq(200)
    end
    it 'should render correct template' do
      get user_posts_path(@new_user)
      expect(response).to render_template('index')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    before :all do
      @new_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.')
      @new_post = Post.create(author: @new_user, title: 'Hello', text: 'This is my first post')
    end
    it 'should responce with success.' do
      get user_post_path(@new_user, @new_post)
      expect(response).to have_http_status(:success)
    end
    it 'should responce with correct status' do
      get user_post_path(@new_user, @new_post)
      expect(response.status).to eq(200)
    end
    it 'should render correct template' do
      get user_post_path(@new_user, @new_post)
      expect(response).to render_template('show')
    end
  end
end
