class PurchaseHistoriesController < ApplicationController

  def create
    @purchase_history = current_user.purchase_histories.build(purchase_history_params)
    if @purchase_history.save
      redirect_to "profiles/review_list", success: "あああああ"
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def purchase_history_params
    params.require(:purchase_history).permit(:purchase_date, :title, :author_name, :note)
  end
end
