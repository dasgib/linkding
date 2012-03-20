class BookmarksController < InheritedResources::Base
  actions :all, except: :show

  has_scope :tagged_with, as: 'tag'
  has_scope :page, default: 1, only: [:index, :recent]
  before_filter :read_tags, only: [:new, :create, :edit, :update]

  def new
    if params[:bookmark] && bookmark = current_user.bookmarks.find_by_url(params[:bookmark][:url])
      redirect_to edit_bookmark_path(bookmark)
    else
      if params[:copy_id]
        @bookmark = Bookmark.find(params[:copy_id]).copy_as_new
      end
      new!
    end
  end

  def index
    # TODO: refactor tag list into a cell as soon as we have Cells
    @tags = current_user.active_tags.limit(50)
    @bookmarks = collection.where(user_id: current_user)
  end

  def recent
    @bookmarks = apply_scopes(Bookmark).public.includes(:site, :tags, :user).order("created_at desc")
    @tags = Bookmark.public.active_tags.limit(50)
  end

  protected

  def collection
    @bookmarks ||= end_of_association_chain.includes(:site, :tags, :user).order("created_at desc")
  end

  def begin_of_association_chain
    current_user
  end

  def read_tags
    @tags = current_user.active_tags.limit(100)
  end
end
