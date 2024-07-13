class PurchaseHistoriesController < ApplicationController
  before_action :set_purchase_history, only: %i[edit update destroy]

  def edit
    add_breadcrumb 'HOME', :root_path
    add_breadcrumb t('profiles.show.review_list'), :review_list_profiles_path
    add_breadcrumb t('.title')
  end

  def create
    @purchase_history = current_user.purchase_histories.build(purchase_history_params)
    if @purchase_history.save
      redirect_to review_list_profiles_path(purchase_history_id: @purchase_history.store_review_id),
                  success: t('.success')
    else
      @store_reviews = current_user.store_reviews.includes(:user).order(created_at: :desc).page(params[:page]).per(9)
      @purchase_histories = current_user.purchase_histories.includes(:user).order(created_at: :desc)
                                        .page(params[:page]).per(9)
      flash.now[:danger] = t('.failure')
      render 'profiles/review_list', status: :unprocessable_entity
    end
  end

  def update
    if @purchase_history.update(purchase_history_params)
      redirect_to review_list_profiles_path, success: t('.success')
    else
      flash.now[:danger] = t('.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @purchase_history.destroy!
    redirect_to review_list_profiles_path, success: t('.success')
  end

  private

  def set_purchase_history
    @purchase_history = current_user.purchase_histories.find(params[:id])
  end

  def purchase_history_params
    params.require(:purchase_history).permit(:purchase_date, :title, :author_name, :note, :store_review_id)
  end
end
