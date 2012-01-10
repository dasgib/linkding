class Bookmark < ActiveRecord::Base
  belongs_to :site
  belongs_to :user

  validates_presence_of :url
  validates_uniqueness_of :site_id, scope: :user_id

  acts_as_taggable

  def url=(url)
    self.site = Site.find_or_create_by_url(url)
  end

  def url
    self.site.try(:url)
  end
end
