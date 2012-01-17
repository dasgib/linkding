Given /^no user exists with an email of "(.*)"$/ do |email|
  assert_nil User.find(:first, :conditions => { :email => email })
end

Given /^I am a user named "([^"]*)" with an email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  user = User.new(username: name, email: email, password: password, password_confirmation: password)
  user.confirm!
  user.save!
  @user = user
end

Given /^I am a new, authenticated user$/ do
  username = 'testing'
  email = 'testing@man.net'
  password = 'secretpass'

  step %{I am a user named "#{username}" with an email "#{email}" and password "#{password}"}
  step %{I go to the sign in page}
  step %{I fill in "user_email" with "#{email}"}
  step %{I fill in "user_password" with "#{password}"}
  step %{I press "Sign in"}
end

Given /^I am signed in$/ do
  step %{I am a new, authenticated user}
end

Then /^I should be already signed in$/ do
  step %{I should see "Sign out"}
end

Given /^I am signed up as "(.*)\/(.*)"$/ do |email, password|
  step %{I am not logged in}
  step %{I go to the sign up page}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I fill in "Password confirmation" with "#{password}"}
  step %{I press "Sign up"}
  step %{I should see "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."}
  step %{I am logout}
end

Given /^I am logout$/ do
  visit(destroy_user_session_path)
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  step %{I am not logged in}
  step %{I go to the sign in page}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I press "Sign in"}
end

Then /^I should be signed in$/ do
  step %{I should see "Signed in successfully."}
end

Then /^I sign out$/ do
  visit(destroy_user_session_path)
end

When /^I return next time$/ do
  step %{I go to the home page}
end

Then /^I should be signed out$/ do
  step %{I should see "Sign in"}
  step %{I should not see "Sign out"}
end

Given /^I am not logged in$/ do
  visit(destroy_user_session_path) # ensure that at least
end
