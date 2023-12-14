class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  scope :last_three_posts, lambda { |user_id|
    Post.where(author_id: user_id).order('posts.created_at DESC').limit(3)
  }
end
