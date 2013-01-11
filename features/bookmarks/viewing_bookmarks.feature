Feature: Viewing bookmarks
  In order to see which bookmarks I created
  As a user
  I want to have a list with my bookmarks

  Background:
    Given I am signed in
    And there is only one bookmark with this data:
      | title       | Google            |
      | url         | http://google.com |
      | tag_list    | google, awesome   |
      | description | A search engine   |

  Scenario: List bookmarks
    When I am on the bookmarks page
    Then I should see "http://google.com"
    And I should see "awesome"
    And I should see "A search engine"

  Scenario: Paginate bookmarks
    Given I have no bookmarks
    And I create 35 bookmarks
    When I am on the bookmarks page
    Then I should see 10 bookmarks
    And I should see 4 pages
    When I follow "4"
    Then I should see 5 bookmarks

  Scenario: Filter by tag
    Given there is a bookmark with this data:
      | title    | Example            |
      | url      | http://example.com |
      | tag_list | mytag              |
    When I am on the bookmarks page
    Then I should see 2 bookmarks
    When I follow "mytag"
    Then I should see 1 bookmark
    And I should see "Example"
    But I should not see "Google"
