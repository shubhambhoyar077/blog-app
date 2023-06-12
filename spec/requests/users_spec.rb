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
end
