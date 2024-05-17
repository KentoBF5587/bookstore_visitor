class BookstoresController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  
  def index
    @bookstores = Bookstore.includes(:user).order(created_at: :desc)
  end

  def new
    @bookstore = Bookstore.new
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

  def show; end

  def edit; end

  def update
    if @bookstore.update(bookstore_params)
      redirect_to bookstore_url(@bookstore), success: t('.success')
    else
      flash.now[:danger] = t('.failure')
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
