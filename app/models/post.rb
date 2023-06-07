class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :post_counter
  has_many :like
  has_many :comment

  scope :post_top_5_comment, ->(post) {post.comment.order(created_at: :desc).limit(5)}
end
