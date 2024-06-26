class WannaGoBookstoresController < ApplicationController
  def create
    @bookstore = Bookstore.find(params[:bookstore_id])
    current_user.wanna_go(@bookstore)
  end

  def destroy
    @bookstore = current_user.wanna_go_bookstores.find(params[:id]).bookstore
    current_user.already_go(@bookstore)
  end
end
