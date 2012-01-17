Given /^I have no bookmarks$/ do
  Bookmark.delete_all
end

When /^I have bookmarks$/ do
  step %{I go to the new bookmark page}
  step %{I fill in "URL" with "http://google.com"}
  step %{I fill in "Title" with "Google"}
  step %{I press "Create Bookmark"}
end

Given /^there is only one bookmark with this data:$/ do |table|
  # table is a | url   | http://google.com |pending
  table = table.rows_hash
  Bookmark.delete_all
  Bookmark.create!(user: @user, url: table[:url], title: table[:title], tag_list: table[:tags])
end

Given /^I (?:have|create) (\d+) bookmarks$/ do |count|
  count.to_i.times do |i|
    Bookmark.create!(user: @user, url: "http://example.com/#{i}", title: "Bookmark#{i}")
  end
end

When /^I should see (\d+) pages$/ do |count|
  page.should have_selector(:css, ".pagination a", text: count)
  page.should have_no_selector(:css, ".pagination a", text: (count.to_i + 1).to_s)
end

Then /^I should see (\d+) bookmarks$/ do |count|
  page.should have_css('.bookmark', count: count.to_i)
end

