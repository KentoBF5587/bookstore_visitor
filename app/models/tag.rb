class Tag < ApplicationRecord
  has_many :tag_relations, dependent: :destroy
  has_many :bookstores, through: :tag_relations

  validates :name, presence: true, length: { maximum: 20 }
end
