class Bookstore < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :address, presence: true, length: { maximum: 255 }

  belongs_to :user
  has_many :store_reviews, dependent: :destroy
  has_many :tag_relations, dependent: :destroy
  has_many :tags, through: :tag_relations
end
