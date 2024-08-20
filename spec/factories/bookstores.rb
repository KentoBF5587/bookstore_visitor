FactoryBot.define do
  factory :bookstore do
    name { "〇〇書店" }
    address { "〇〇県〇〇市" }
    association :user
  end
end