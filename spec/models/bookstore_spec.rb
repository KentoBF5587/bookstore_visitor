require 'rails_helper'

RSpec.describe Bookstore, type: :model do
  describe 'バリデーションチェック' do
    it '設定したすべてのバリデーションが機能しているか' do
      bookstore = build(:bookstore)
      expect(bookstore).to be_valid
      expect(bookstore.errors).to be_empty
    end

    it 'nameがない場合にバリデーションが機能してinvalidになるか' do
      bookstore_without_name = build(:bookstore, name: "")
      expect(bookstore_without_name).to be_invalid
      expect(bookstore_without_name.errors[:name]).to eq ["を入力してください"]
    end

    it 'addressがない場合にバリデーションが機能してinvalidになるか' do
      bookstore_without_address = build(:bookstore, address: "")
      expect(bookstore_without_address).to be_invalid
      expect(bookstore_without_address.errors[:address]).to eq ["を入力してください"]
    end

  end
end
