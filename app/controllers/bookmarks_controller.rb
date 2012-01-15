class BookmarksController < InheritedResources::Base

  has_scope :tagged_with, as: 'tag'
  has_scope :page, default: 1

  def index
    # TODO: refactor tag list into a cell as soon as we have Cells
    @tags = current_user.active_tags.limit(50)
    index!
  end

  def create
    create! { bookmarks_path }
  end

  protected

  def collection
    @bookmarks ||= end_of_association_chain.includes(:site, :tags).order("created_at desc")
  end

  def begin_of_association_chain
    current_user
  end
end
