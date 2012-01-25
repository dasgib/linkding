class HomeController < ApplicationController
  def index
    redirect_to bookmarks_path, notice: flash[:notice]
  end
end
