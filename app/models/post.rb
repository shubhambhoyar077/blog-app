class Post < ApplicationRecord
  belongs_to :user, foreign_key: "author_id", counter_cache: :post_counter
  has_many :user, through: :like
  has_many :user, through: :comment
end
