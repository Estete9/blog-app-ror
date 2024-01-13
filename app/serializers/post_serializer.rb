class PostSerializer < ActiveModel::Serializer
  attributes :id, :author_id, :title, :text, :comments_counter, :likes_counter
end
