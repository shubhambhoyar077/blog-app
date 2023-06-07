require 'rails_helper'

describe Comment, type: :model do
  test_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.')
  test_post = Post.create(author: test_user, title: 'Hello', text: 'This is my first post')
  test_comment = Comment.new(post: test_post, author: test_user)

  before { test_comment.save }
  it 'comment should increase user comment counter by 1' do
    # it will increase automatically after comment save
    expect(test_post.comments_counter).to eq(1)
  end
end
