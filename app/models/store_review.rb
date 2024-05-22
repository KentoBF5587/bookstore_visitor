class StoreReview < ApplicationRecord
  validates :date_entered, presence: true
  validates :opportunity, presence: true
  validates :first_visit, presence: true
  validates :favorite_reason, presence: true
  validates :free_description, length: { maximum: 400 }
  
  belongs_to :bookstore
  belongs_to :user
end
