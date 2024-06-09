class WannaGoBookstoresController < ApplicationController

  def create
    @bookstore = Bookstore.find(params[:bookstore_id])
    current_user.wanna_go(@bookstore)
    redirect_to bookstore_path(@bookstore), success: t('.wanna_go')
  end

  def destroy
    @bookstore = current_user.wanna_go_bookstores.find(params[:id]).bookstore
    current_user.already_go(@bookstore)
    redirect_to bookstore_path(@bookstore), success: t('.already_go'), status: :see_other
  end
end
