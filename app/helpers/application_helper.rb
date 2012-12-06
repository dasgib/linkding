module ApplicationHelper
  def avatar(user, options = {})
    size = options.delete(:size) || 60
    https = options.delete(:https)
    base_url = https ? "https://secure.gravatar.com" : "http://www.gravatar.com"
    image_tag "#{base_url}/avatar/#{Digest::MD5.new.hexdigest(user.email.downcase)}?s=#{size}", options.merge(alt: "")
  end
end
