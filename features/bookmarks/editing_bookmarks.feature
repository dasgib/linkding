Feature: Editing bookmarks
  In order to change the details of a bookmark
  As a user
  I want a form to edit the bookmark

  Background:
    Given I am signed in
    And there is only one bookmark with this data:
      | title | Google |
      | url   | http://google.com |
      | tags  | google |
    And I am on the bookmarks page
    When I follow "Edit"

  Scenario: Update a bookmark
    When I fill in "Title" with "Google.de"
    And I fill in "URL" with "http://google.de"
    And I fill in "Tags" with "google, search engine"
    And I press "Update Bookmark"
    Then I should see "Bookmark was successfully updated."
    And I should see "Google.de"
    And I should see "http://google.de"
    And I should see "google"
    And I should see "search engine"

  Scenario: Update a bookmark with invalid data
    When I fill in "URL" with ""
    And I press "Update Bookmark"
    Then I should see "URL can't be blank"
