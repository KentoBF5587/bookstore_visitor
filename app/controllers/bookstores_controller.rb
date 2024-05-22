class BookstoresController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_bookstore, only: %i[edit update destroy]

  def index
    @bookstores = Bookstore.includes(:user).order(created_at: :desc)
  end

  def show
    @bookstore = Bookstore.find(params[:id])
    @store_reviews = @bookstore.store_reviews
  end

  def new
    @bookstore = Bookstore.new
  end

  def edit; end

  def create
    @bookstore = current_user.bookstores.build(bookstore_params)
    if @bookstore.save
      redirect_to bookstores_path, success: t('.success')
    else
      flash.now[:danger] = t('.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @bookstore.update(bookstore_params)
      redirect_to bookstore_path(@bookstore), success: t('.success')
    else
      flash.now[:danger] = t('.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bookstore.destroy!
    redirect_to bookstores_path, success: t('.success'), status: :see_other
  end

  private

  def bookstore_params
    params.require(:bookstore).permit(:name, :address, tag_ids: [])
  end

  def set_bookstore
    @bookstore = Bookstore.find(params[:id])
  end
end
