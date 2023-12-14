class Post < ApplicationRecord
  belongs_to :author, counter_cache: :posts_counter, class_name: 'User'

  has_many :comments
  has_many :likes

  scope :last_five_comments, lambda { |post_id|
    Comment.where(post_id: post_id).order('comments.created_at DESC').limit(5)
  }
end
