require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it 'should responce with success.' do
      get users_path
      expect(response).to have_http_status(:success)
    end
    it 'should responce with correct status' do
      get users_path
      expect(response.status).to eq(200)
    end
    it 'should include correct placeholder text.' do
      get users_path
      expect(response.body).to include("Users List")
  end
  it 'should render correct template' do
    get users_path
    expect(response).to render_template('index')
  end
  end

  describe "GET /users/:id" do
    before :all do
      @new_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.')
    end
    it 'should responce with success.' do
      
      # new_user = User.create! valid_attributes
      get user_url(@new_user)
      expect(response).to have_http_status(:success)
    end
    it 'should responce with correct status' do
      get user_url(@new_user)
      expect(response.status).to eq(200)
    end
    it 'should include correct placeholder text.' do
      get user_url(@new_user)
      expect(response.body).to include("User details")
  end
  it 'should render correct template' do
    get user_url(@new_user)
    expect(response).to render_template('show')
  end
  end
end
