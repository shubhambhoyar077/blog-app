require 'rails_helper'

RSpec.describe Post, type: :system do
  describe 'Post index page' do
    before do
      @user = User.create(name: 'Anna', photo: 'https://unsplash.com/photos', bio: 'Project manager')
      @first_post = Post.create(author_id: @user.id, title: 'First post', text: 'First post')
      @comment = Comment.create(author: @user, post: @first_post, text: 'I like it')
      Like.create(author: @user, post: @first_post)
      visit user_posts_path(@user)
    end
    it "I can see the user's profile picture." do
      expect(page).to have_css("img[src='https://unsplash.com/photos']")
    end
    it "I can see the user's username." do
      expect(page).to have_content(@user.name)
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content('Number of posts: 1')
    end
    it "I can see a post's title." do
      expect(page).to have_content(@first_post.title)
    end
    it "I can see some of the post's body." do
      expect(page).to have_content(@first_post.text)
    end
    it 'I can see the first comments on a post.' do
      expect(page).to have_content("#{@user.name}: #{@comment.text}")
    end
    it 'I can see how many comments a post has.' do
      expect(page).to have_content('Comments: 1')
    end
    it 'I can see how many likes a post has.' do
      expect(page).to have_content('Likes: 1')
    end
    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content('Pagination')
    end
    it 'When I click on a post, it redirects me to that posts show page.' do
      click_link 'First post'
      expect(page).to have_current_path(user_post_path(@user, @first_post))
    end
  end
end
