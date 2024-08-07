class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :info, :warning, :danger

  private

  def not_authenticated
    redirect_to '/select_login', danger: t('defaults.flash_message.require_login')
  end
end
