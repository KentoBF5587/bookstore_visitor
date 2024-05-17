class Bookstore < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :address, presence: true, length: { maximum: 255 }

  belongs_to :user
end
