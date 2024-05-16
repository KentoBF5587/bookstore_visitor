class BookstoresController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @bookstores = Bookstore.all.order(created_at: desc)
  end

  def new
    @bookstore = Bookstore.new
  end

  def create
    @bookstore = Bookstore.new(:bookstore_params)
    if @bookstore.save
      redirect_to bookstores_path, success: "あああ"
    else
      flash.now[:danger] = "作れてないよ"
      render :new, status: :unprocessable_entity
  end

  def show
    @bookstore = Bookstore.find(params[:id])
  end

  def edit; end

  def update
    if @bookstore.update(bookstore_params)
      redirect_to bookstore_url(@bookstore), success: "いええええええ！"
    else
      flash.now[:danger] = "ノオオオオオ"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @board.destroy!
    redirect_to bookstores_path, success: "あああああ", status: :see_other
  end

  private

  def bookstore_params
    params.require(:bookstore).permit(:name, :address)
  end
end
