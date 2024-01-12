class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :post_id, :text
  belongs_to :post
end
