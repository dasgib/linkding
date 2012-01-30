module ApplicationHelper
  def avatar(user, options = {})
    size = options.delete(:size) || 40
    https = options.delete(:https)
    base_url = https ? "https://secure.gravatar.com" : "http://www.gravatar.com"
    image_tag "#{base_url}/avatar/#{Digest::MD5.new.hexdigest(user.email.downcase)}?s=#{size}", options
  end

  def bookmarklet_popup
    location = "encodeURIComponent(window.location)"
    title = "encodeURIComponent(window.document.title)"
    description = "encodeURIComponent((window.getSelection ? window.getSelection() : (document.getSelection ? document.getSelection() : (document.selection ? document.selection.createRange().text : ''))))"
    url = %{"#{new_bookmark_url}?bookmark[url]=" + #{location} + "&bookmark[title]=" + #{title} + "&bookmark[description]=" + #{description}}

    window_options = "width=600,height=400,status=yes,scrollbars=yes,resizable=yes"

    link_to "Bookmarklet (Popup)", %{javascript:open(#{url}, "bookmark", "#{window_options}").focus();}
  end

  def bookmarklet
    link_to "Bookmarklet (Inline)", "javascript:(function(){%20var%20u='" + root_url + "';%20var%20d=document;%20function%20l(){%20if(!d.body)return%20p();%20if(!d.getElementById('ldbmlcont')){%20var%20s=d.createElement('script');%20s.src=u%20+%20'bookmarklet.js?v=0.1';%20s.id='ldbmlcont';%20d.body.appendChild(s);%20}%20s=setInterval(function(){%20u=0;%20try%20{%20u=!!(typeof%20ldbmlinit=='function');%20}%20catch(i){}%20if(u){%20clearInterval(s);%20ldbmlinit('0.1');%20}%20},%20200);%20}%20try%20{%20l();%20}%20catch(e){%20}%20})();"
  end
end
