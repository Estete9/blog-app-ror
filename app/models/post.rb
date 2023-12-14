class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  # , counter_cache: :posts_counter

  has_many :comments
  has_many :likes

  def last_five_comments
    comments.order('created_at DESC').limit(5)
  end

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
