Feature: Sign out
  As a signed in user
  I should be able to sign out
  In order to protect my account from unauthorized access

    Scenario: User signs out
      Given I am a user named "foo" with an email "user@test.com" and password "please"
      When I sign in as "user@test.com/please"
      Then I should be signed in
      And I sign out
      Then I should be signed out
