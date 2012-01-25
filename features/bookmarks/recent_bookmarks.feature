Feature: Viewing bookmarks
  In order to see which bookmarks other users created
  As a user
  I want to have a list with all public recent bookmarks

  Scenario: List recent bookmarks
    Given I am signed in
    And I have a public bookmark with title "My bookmark"
    And there is a private bookmark of another user with title "Private bookmark"
    And there is a public bookmark of another user with title "Public bookmark"
    When I am on the recent bookmarks page
    Then I should see "My bookmark"
    And I should see "Public bookmark"
    But I should not see "Private bookmark"