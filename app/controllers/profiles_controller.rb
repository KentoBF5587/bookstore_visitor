class ProfilesController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  add_breadcrumb "HOME", :root_path

  def show
    add_breadcrumb t('.profile')
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profiles_path, success: t('.success')
    else
      flash.now[:danger] = t('.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def bookstore_list
    add_breadcrumb t('profiles.show.wanna_go_bookstore')
    @wanna_bookstores = current_user.wanna_bookstores.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def review_list
    add_breadcrumb t('profiles.show.store_review')
    @store_reviews = current_user.store_reviews.includes(:user).order(created_at: :desc).page(params[:page])
    @purchase_history = PurchaseHistory.new
    @purchase_histories = current_user.purchase_histories.includes(:user).order(created_at: :desc)
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :profile)
  end
end
