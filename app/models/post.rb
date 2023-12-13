class Post < ApplicationRecord
  belongs_to :author, counter_cache: :posts_counter, class_name: 'User'

  has_many :comments
  has_many :likes
end
