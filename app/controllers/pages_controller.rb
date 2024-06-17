class PagesController < ApplicationController
  skip_before_action :require_login, only: %i[how_to_use inquiry]

  def how_to_use; end

  def inquiry; end
end
