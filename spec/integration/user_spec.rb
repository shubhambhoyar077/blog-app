require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'index page' do
    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.'))
      User.create(name: 'Shubham', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.')
      User.create(name: 'Enis', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.')
      visit root_path
    end
    it 'shows the right content' do
      expect(page).to have_content("Welcome Tom")
    end
    it 'I can see the username of all other users' do
      expect(page).to have_content("Shubham")
      expect(page).to have_content("Enis")
      expect(page).to have_content("Tom")
    end
    it 'I can see the profile picture for each user.' do
      expect(page).to have_css("img[src='https://unsplash.com/photos']")
      expect(page).to have_css("img[src='https://unsplash.com/photos']")
      expect(page).to have_css("img[src='https://unsplash.com/photos']")
    end
  end
end