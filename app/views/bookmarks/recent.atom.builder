atom_feed do |feed|
  feed.title("Linkding Recent Bookmarks")

  @bookmarks.each do |bookmark|
    feed.entry(bookmark, url: bookmark.url) do |entry|
      entry.title(bookmark.title)
      entry.content(bookmark.description)

      entry.author do |author|
        author.name(bookmark.user.username)
      end
    end
  end
end
