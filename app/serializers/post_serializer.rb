class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :likes, :user_id
  belongs_to :user
end
