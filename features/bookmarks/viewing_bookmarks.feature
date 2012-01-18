Feature: Viewing bookmarks
  In order to see which bookmarks I created
  As a user
  I want to have a list with my bookmarks

  Background:
    Given I am signed in
    And there is only one bookmark with this data:
      | title | Google            |
      | url   | http://google.com |
      | tags  | google            |

  Scenario: List bookmarks
    When I am on the bookmarks page
    Then I should see "http://google.com"

  Scenario: Paginate bookmarks
    Given I have no bookmarks
    And I create 70 bookmarks
    When I am on the bookmarks page
    Then I should see 30 bookmarks
    And I should see 3 pages
    When I follow "3"
    Then I should see 10 bookmarks

  Scenario: Filter by tag
    Given there is a bookmark with this data:
      | title | Example            |
      | url   | http://example.com |
      | tags  | mytag              |
    When I am on the bookmarks page
    Then I should see 2 bookmarks
    When I follow "mytag"
    Then I should see 1 bookmark
    And I should see "Example"
    But I should not see "Google"
