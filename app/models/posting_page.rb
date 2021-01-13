class PostingPage < ApplicationRecord
  belongs_to :user
  has_many :favourites, dependent: :destroy
  has_many :favourite_users, through: :favourites, source: :user
  validates :content, presence: true
  mount_uploader :image, ImageUploader
end
