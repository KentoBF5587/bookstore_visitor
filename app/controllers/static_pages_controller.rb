class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]

  def top
    @bookstore = Bookstore.all
    @store_review = StoreReview.all
  end
end
