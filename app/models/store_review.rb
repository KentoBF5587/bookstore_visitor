class StoreReview < ApplicationRecord
  validates :date_entered, presence: true
  validates :opportunity, presence: true
  validates :first_visit, presence: true
  validates :favorite_reason, presence: true
  validates :free_description, length: { maximum: 400 }

  has_many :purchase_histories, dependent: :destroy
  belongs_to :bookstore
  belongs_to :user

  def bookstore_name
    bookstore_name = bookstore.name
  end
end
