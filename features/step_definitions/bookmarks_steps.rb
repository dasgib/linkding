Given /^I have no bookmarks$/ do
  Bookmark.delete_all
end

When /^I have a public bookmark with title "([^"]*)"$/ do |title|
  Factory.create(:bookmark, title: title, user: @user, public: true)
end

When /^there is a (private|public) bookmark of another user with title "([^"]*)"$/ do |visibility, title|
  Factory.create(:bookmark, title: title, user: Factory.create(:user), public: (visibility == 'public'))
end

When /^I have bookmarks$/ do
  step %{I go to the new bookmark page}
  step %{I fill in "URL" with "http://google.com"}
  step %{I fill in "Title" with "Google"}
  step %{I press "Create Bookmark"}
end

Given /^there is a bookmark with this data:$/ do |table|
  Factory.create(:bookmark, table.rows_hash.merge(user: @user))
end

Given /^there is only one bookmark with this data:$/ do |table|
  Bookmark.delete_all
  step %{there is a bookmark with this data:}, table
end

Given /^I (?:have|create) (\d+) bookmark(?:s)?$/ do |count|
  count.to_i.times do |i|
    Factory.create(:bookmark, user: @user)
  end
end

Then /^I should see (\d+) pages$/ do |count|
  page.should have_selector(:css, ".pagination a", text: count)
  page.should have_no_selector(:css, ".pagination a", text: (count.to_i + 1).to_s)
end

Then /^I should see (\d+) bookmark(?:s)?$/ do |count|
  page.should have_css('.bookmark', count: count.to_i)
end

Then /^I should have (\d+) bookmarks$/ do |count|
  Bookmark.count.should == count.to_i
end
