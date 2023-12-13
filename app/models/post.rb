class Post < ApplicationRecord
  belongs_to :author, counter_cache = :posts_counter
end
