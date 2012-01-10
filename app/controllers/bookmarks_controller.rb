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
    @bookmarks ||= end_of_association_chain.includes(:site).includes(:tags).paginate(page: params[:page], per_page: 10)
  end
end
