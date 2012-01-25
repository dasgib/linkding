Feature: Delete bookmarks
  In order to remove a bookmark
  As a user
  I want to click a link do delete the bookmark

  Background:
    Given I am signed in
    And there is only one bookmark with this data:
      | title    | Google            |
      | url      | http://google.com |
      | tag_list | google            |
    And I am on the bookmarks page

  Scenario: Deleting a bookmark
    When I follow "Destroy"
    Then I should see "Bookmark was successfully destroyed."
    And I should be on the bookmarks page
    And I should not see "http://google.com"
