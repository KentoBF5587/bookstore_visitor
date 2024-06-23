class PagesController < ApplicationController
  skip_before_action :require_login, only: %i[how_to_use inquiry select_login]

  def how_to_use; end

  def inquiry; end

  def select_login; end
end
