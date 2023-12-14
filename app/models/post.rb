class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  # , counter_cache: :posts_counter

  has_many :comments
  has_many :likes

  scope :last_five_comments, lambda { |post_id|
    Comment.where(post_id: post_id).order('comments.created_at DESC').limit(5)
  }

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
