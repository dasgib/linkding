Given /^I have no bookmarks$/ do
  Bookmark.delete_all
end
When /^I have bookmarks$/ do
  step %{I go to the new bookmark page}
  step %{I fill in "URL" with "http://google.com"}
  step %{I fill in "Title" with "Google"}
  step %{I press "Create Bookmark"}
end
