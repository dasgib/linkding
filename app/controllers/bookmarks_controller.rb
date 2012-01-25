class BookmarksController < InheritedResources::Base
  actions :all, except: :show

  has_scope :tagged_with, as: 'tag'
  has_scope :page, default: 1, only: [:index, :recent]

  def index
    # TODO: refactor tag list into a cell as soon as we have Cells
    @tags = current_user.active_tags.limit(50)
    @bookmarks = collection.where(user_id: current_user)
    index!
  end

  def recent
    @bookmarks = collection.public
    @tags = Bookmark.public.active_tags.limit(50)
    render :index
  end

  protected

  def collection
    @bookmarks ||= end_of_association_chain.includes(:site, :tags).order("created_at desc")
  end
end
