class BookmarksController < InheritedResources::Base

  def new
    @bookmark = current_user.bookmarks.build
    new!
  end

  def create
    @bookmark = current_user.bookmarks.build(params[:bookmark])
    create! { bookmarks_path }
  end
end
