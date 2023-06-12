require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it 'test' do
      get users_path
      expect(page).to have_content("j")
    end
    it 'test' do
      get users_path
      expect(response).to have_http_status(:success)
    end
  end
end
