Feature: Editing bookmarks
  In order to change the details of a bookmark
  As a user
  I want a form to edit the bookmark

  Background:
    Given I am signed in
    And there is only one bookmark with this data:
      | title       | Google                   |
      | url         | http://google.com        |
      | tag_list    | google                   |
      | description | Who doesn't know Google? |
    And I am on the bookmarks page
    When I follow "Edit"

  Scenario: Update a bookmark
    When I fill in "Title" with "Google.de"
    And I fill in "URL" with "http://google.de"
    And I fill in "Tags" with "google, search engine"
    And I fill in "Description" with "The best search of the world"
    And I press "Update Bookmark"
    Then I should see "Bookmark was successfully updated."
    And I should see "Google.de"
    And I should see "http://google.de"
    And I should see "google"
    And I should see "The best search of the world"
    And I should see "search engine"

  Scenario: Update a bookmark with invalid data
    When I fill in "URL" with ""
    And I press "Update Bookmark"
    Then the "URL" field should have the error "can't be blank"
