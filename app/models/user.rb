class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
  validates :profile, length: { maximum: 65_535 }
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  has_many :bookstores
  has_many :store_reviews, dependent: :destroy
  has_many :wanna_go_bookstores, dependent: :destroy
  has_many :wanna_bookstores, through: :wanna_go_bookstores, source: :bookstore
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  def own?(object)
    object.user_id == id
  end

  def wanna_go(bookstore)
    wanna_bookstores << bookstore
  end

  def already_go(bookstore)
    wanna_bookstores.delete(bookstore)
  end

  def wanna_go?(bookstore)
    wanna_bookstores.include?(bookstore)
  end
end
