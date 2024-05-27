class Bookstore < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :address, presence: true, length: { maximum: 255 }

  belongs_to :user
  has_many :store_reviews, dependent: :destroy
  has_many :tag_relations, dependent: :destroy
  has_many :tags, through: :tag_relations

  def self.ransackable_attributes(_auth_object = nil)
    %w[name address]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end

  scope :tag_join, ->(tag_name) { joins(:tags).where(tags: { name: tag_name }) }
end
