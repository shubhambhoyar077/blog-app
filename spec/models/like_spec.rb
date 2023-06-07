require 'rails_helper'

describe Like, type: :model do
  test_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.')
  test_post = Post.create(author: test_user, title: 'Hello', text: 'This is my first post')
  test_like = Like.new(post: test_post, author: test_user)

  before { test_like.save }
  it 'like should increase user like counter by 1' do
    # it will increase automatically after like save
    expect(test_post.likes_counter).to eq(1)
  end
end
