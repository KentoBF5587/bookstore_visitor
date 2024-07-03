class PurchaseHistory < ApplicationRecord
  validates :title, presence: true
  validates :note, length: { maximum: 255 }

  belongs_to :user
  belongs_to :bookstore
  belongs_to :store_review
end
