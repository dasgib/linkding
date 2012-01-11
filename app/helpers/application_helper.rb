module ApplicationHelper
  def avatar(user, options = {})
    size = options.delete(:size) || 40
    image_tag "http://www.gravatar.com/avatar/#{Digest::MD5.new.hexdigest(user.email.downcase)}?s=#{size}", options
  end
end
