class Bookmark < ActiveRecord::Base
  belongs_to :site
  belongs_to :user
  belongs_to :import

  validates :url, presence: true, length: {maximum: 2048}
  validates :title, presence: true, length: {maximum: 1024}
  validates_uniqueness_of :site_id, scope: :user_id

  acts_as_taggable

  scope :public_visible, where(public: true)

  scope :recent, ->(limit = 200) { order("id DESC").limit(limit) }

  after_validation :set_tag_array

  def self.find_by_url(url)
    joins(:site).where("sites.url" => url).first if url
  end

  def self.active_tags
    tag_counts.order('count desc')
  end

  def self.recent_tags
    ActsAsTaggableOn::Tag.joins(:taggings)
      .where("taggings.taggable_id IN (#{scoped.select("id").to_sql})")
      .where("taggings.taggable_type" => Bookmark)
  end

  def self.active_tag_names
    recent_tags.group("tags.id").order("count(tags.id) DESC").select("tags.name")
  end

  def self.search(query, language = 'english')
    columns = [
        "title",
        "coalesce(description, '')"
    ]

    tsvector_sql = columns.map { |c| "to_tsvector('#{language}', #{c})" }.join(" || ")
    tsvector_sql << " || array_to_tsvector('#{language}', tag_array)"
    where("#{tsvector_sql} @@ plainto_tsquery('#{language}', ?)", query)
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


  def set_tag_array
    self.tag_array = self.tag_list
  end
end
