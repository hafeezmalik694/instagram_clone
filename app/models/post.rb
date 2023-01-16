class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many_attached :images
  validates :images , blob: { content_type: ['image/jpeg','image/png','image/jpg','image/webp']}
  
 def post_user_name
    user&.username
 end

end
