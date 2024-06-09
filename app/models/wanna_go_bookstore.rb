class WannaGoBookstore < ApplicationRecord
  belongs_to :user
  belongs_to :bookstore
  validates :user_id, uniqueness: { scope: :bookstore_id }
end
