class Post < ApplicationRecord
  belongs_to :author, counter_cache: :posts_counter

  has_many :comment
  has_many :like
end
