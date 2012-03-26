class Bookmark < ActiveRecord::Base
  belongs_to :site
  belongs_to :user
  belongs_to :import

  validates :url, presence: true, length: {maximum: 2048}
  validates :title, presence: true, length: {maximum: 1024}
  validates_uniqueness_of :site_id, scope: :user_id

  acts_as_taggable

  scope :public_visible, where(public: true)

  def self.find_by_url(url)
    joins(:site).where("sites.url" => url).first if url
  end

  def self.active_tags
    tag_counts.order('count desc')
  end

  def url=(url)
    self.site = Site.find_or_create_by_url(url)
  end

  def url
    self.site.try(:url)
  end

  def copy_as_new
    Bookmark.new(url: self.url, title: self.title, description: self.description, tag_list: self.tag_list)
  end

end
