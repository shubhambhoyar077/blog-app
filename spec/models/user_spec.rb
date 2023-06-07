require 'rails_helper'

describe User, type: :model do
  subject {User.new(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.')}

  before {subject.save}
  it "Name should be present" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  before {subject.save}
  it "Name should contan some char" do
    subject.name = '    '
    expect(subject).to_not be_valid
  end

  it "post counter should be integer" do
    subject.post_counter = 1.5
    expect(subject).to_not be_valid
  end

  it "post counter should be greated than zero" do
    subject.post_counter = -1
    expect(subject).to_not be_valid
  end

  it "user should return top 3 post" do
    test_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.')
    Post.create(author: test_user, title: 'Hello', text: 'This is my first post')
    Post.create(author: test_user, title: 'Hello', text: 'This is my second post')
    Post.create(author: test_user, title: 'Hello', text: 'This is my third post')
    Post.create(author: test_user, title: 'Hello', text: 'This is my fourth post')
    expect(test_user.top_3_posts[0].text).to eq('This is my fourth post')
  end
end