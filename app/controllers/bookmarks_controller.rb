class BookmarksController < InheritedResources::Base

  def new
    @bookmark = current_user.bookmarks.build
    new!
  end

  def create
    @bookmark = current_user.bookmarks.build(params[:bookmark])
    create! { bookmarks_path }
  end

  protected

  def collection
    @bookmarks ||= current_user.bookmarks.includes(:site, :tags).order("created_at desc").paginate(page: params[:page], per_page: 10)
  end
end
