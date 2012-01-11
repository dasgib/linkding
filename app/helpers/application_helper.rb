module ApplicationHelper

  def bookmarklet
    location = "encodeURIComponent(window.location)"
    title = "encodeURIComponent(window.document.title)"
    url = %{"#{new_bookmark_url}?bookmark[url]=" + #{location} + "&bookmark[title]=" + #{title}}

    window_options = "width=600,height=400,status=yes,scrollbars=yes,resizable=yes"

    link_to "Bookmarklet", %{javascript:open(#{url}, "bookmark", "#{window_options}").focus();}
  end
end
