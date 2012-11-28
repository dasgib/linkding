class User < ActiveRecord::Base
  devise :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         # :omniauthable,
         :timeoutable, :lockable, :token_authenticatable,
         :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  has_many :bookmarks
  has_many :imports

  def active_tags
    bookmarks.recent.active_tags
  end

  def active_tag_names
    bookmarks.recent.active_tag_names
  end
end
