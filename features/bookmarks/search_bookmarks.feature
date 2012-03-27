Feature: Searching bookmarks
  As a user
  In order to find bookmarks for a specific topic
  I want to do a fulltext search

  Background:
    Given I am signed in
    And there are the following bookmarks:
      | title   | description               | tag_list     | url               | public |
      | Google  | The default search engine | search, foo  | http://google.com | true   |
      | Bing    | The uncool search engine  | search, bing | http://bing.com   | true   |
      | Example | Just an example           | test         | http://foobar.com | false  |
    And there is a bookmark from another user with this data:
      | title                | description | public |
      | other users bookmark | example     | true   |
      | private bookmark     | example     | false  |
    And I am on the bookmarks page

  Scenario: Search in title
    When I search for "Google"
    Then I should see "http://google.com"

  Scenario: Search in description
    When I search for "uncool"
    Then I should see "http://bing.com"

  Scenario: Search in tags
    When I search for "test"
    Then I should see "http://foobar.com"
    But I should not see "http://google.com"
    And I should not see "http://bing.com"

  Scenario: Find multiple results
    When I search for "search"
    Then I should see "http://google.com"
    And I should see "http://bing.com"
    But I should not see "http://foobar.com"

  Scenario: Find only my bookmarks
    When I search for "example"
    Then I should see "http://foobar.com"
    But I should not see "other users bookmark"

  Scenario: Find recent bookmarks
    When I go to the recent bookmarks page
    And I search for "example"
    Then I should see "other users bookmark"
    But I should not see "private bookmark"
    And I should not see "http://foobar.com"
