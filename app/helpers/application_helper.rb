module ApplicationHelper
  def avatar(user, options = {})
    size = options.delete(:size) || 40
    https = options.delete(:https)
    base_url = https ? "https://secure.gravatar.com" : "http://www.gravatar.com"
    image_tag "#{base_url}/avatar/#{Digest::MD5.new.hexdigest(user.email.downcase)}?s=#{size}", options
  end

  def bookmarklet
    location = "encodeURIComponent(window.location)"
    title = "encodeURIComponent(window.document.title)"
    url = %{"#{new_bookmark_url}?bookmark[url]=" + #{location} + "&bookmark[title]=" + #{title}}

    window_options = "width=600,height=400,status=yes,scrollbars=yes,resizable=yes"

    link_to "Bookmarklet", %{javascript:open(#{url}, "bookmark", "#{window_options}").focus();}
  end
end
