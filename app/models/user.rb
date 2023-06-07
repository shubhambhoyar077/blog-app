class User < ApplicationRecord
  has_many :post, foreign_key: "author_id"
  has_many :post, through: :like
  has_many :post, through: :comment
end
