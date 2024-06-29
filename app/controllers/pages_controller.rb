class PagesController < ApplicationController
  skip_before_action :require_login, only: %i[how_to_use inquiry select_login terms_of_service privacy_policy]

  def how_to_use; end

  def inquiry; end

  def select_login; end

  def terms_of_service; end

  def privacy_policy; end
end
