class TagRelation < ApplicationRecord
  belongs_to :tag
  belongs_to :bookstore
end
