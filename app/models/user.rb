class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         # :omniauthable,
         :timeoutable, :lockable, :token_authenticatable,
         :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  has_many :bookmarks

  def active_tags
    bookmarks.tag_counts.order('count desc')
  end
end
