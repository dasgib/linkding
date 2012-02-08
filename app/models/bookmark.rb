class Bookmark < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  mapping do
    indexes :id, index: :not_analyzed
    indexes :title
    indexes :description
    indexes :url, as: 'url'
    indexes :tags, as: 'tag_list', analyzer: 'keyword'
    indexes :user_id, index: :not_analyzed
  end

  belongs_to :site
  belongs_to :user
  belongs_to :import

  validates :url, presence: true, length: {maximum: 2048}
  validates :title, presence: true, length: {maximum: 1024}
  validates_uniqueness_of :site_id, scope: :user_id

  acts_as_taggable

  scope :public, where(public: true)

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
end
