class HomeController < ApplicationController
  def index
    redirect_to bookmarks_path
  end
end
