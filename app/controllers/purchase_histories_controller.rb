class PurchaseHistoriesController < ApplicationController

  def create
    @purchase_history = current_user.purchase_histories.build(purchase_history_params)
    if @purchase_history.save
      redirect_to review_list_profiles_path(purchase_history_id: @purchase_history.store_review_id), success: "購入記録が作成できました"
    else
      @store_reviews = current_user.store_reviews.includes(:user).order(created_at: :desc).page(params[:page])
      @purchase_histories = current_user.purchase_histories.includes(:user).order(created_at: :desc)
      flash.now[:danger] = "失敗しました"
      render "profiles/review_list"
    end
  end

  def edit; end

  def update; end

  def destroy
    @purchase_history = current_user.purchase_histories.find(params[:id])
    @purchase_history.destroy!
    redirect_to review_list_profiles_path
  end

  private

  def purchase_history_params
    params.require(:purchase_history).permit(:purchase_date, :title, :author_name, :note, :store_review_id)
  end
end
