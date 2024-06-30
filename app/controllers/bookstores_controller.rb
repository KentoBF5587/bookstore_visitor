class BookstoresController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_bookstore, only: %i[edit update destroy]

  add_breadcrumb "HOME", :root_path

  def index
    add_breadcrumb t('.title'), :bookstores_path
    @q = Bookstore.ransack(params[:q])
    @bookstores = if params[:tag_name]
                    @q.result(distinct: true).includes(:user).order(created_at: :desc).tag_join(params[:tag_name]).page(params[:page])
                  else
                    @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
                  end
  end

  def show
    @bookstore = Bookstore.find(params[:id])
    add_breadcrumb t('.index.title'), :bookstores_path
    add_breadcrumb @bookstore.name, :bookstore_path
    @store_reviews = @bookstore.store_reviews.order(created_at: :desc)
    gon.bookstore_lat = @bookstore.latitude
    gon.bookstore_lng = @bookstore.longitude
  end

  def new
    add_breadcrumb t('.index.title'), :bookstores_path
    add_breadcrumb t('.title')
    @bookstore = Bookstore.new
  end

  def edit
    add_breadcrumb t('.index.title'), :bookstores_path
    add_breadcrumb @bookstore.name, :bookstore_path
    add_breadcrumb t('.title')
  end

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
