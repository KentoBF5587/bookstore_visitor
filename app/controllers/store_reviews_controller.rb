class StoreReviewsController < ApplicationController
  skip_before_action :require_login, only: %i[show]
  before_action :set_store_review, only: %i[edit update destroy]

  def show
    @store_review = StoreReview.find(params[:id])
  end

  def new
    @bookstore = Bookstore.find(params[:bookstore_id])
    @store_review = StoreReview.new
  end

  def edit; end

  def create
    @bookstore = Bookstore.find(params[:bookstore_id])
    @store_review = @bookstore.store_reviews.build(store_review_params)
    @store_review.user = current_user

    if @store_review.save
      redirect_to bookstore_url(@bookstore), success: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @store_review.update(store_review_params)
      redirect_to @store_review.bookstore, success: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @store_review.destroy!
    redirect_to bookstore_path(@bookstore), success: t('.success')
  end

  private

  def set_store_review
    @store_review = current_user.store_reviews.find(params[:id])
    @bookstore = Bookstore.find(@store_review.bookstore_id)
  end

  def store_review_params
    params.require(:store_review).permit(:date_entered, :opportunity, :first_visit, :favorite_reason, :free_description)
  end
end
