Feature: Add bookmark
  As a user
  I want to be able to add a bookmark
  In order to have access to it at any time

  Background:
    Given I am signed in

  Scenario Outline: I want to see a "add bookmark" button all the time
    When I am on <page>
    Then I should see "Add Bookmark"

    Examples:
      | page               |
      | the home page      |
      | the bookmarks page |

  Scenario: User adds bookmark
    Given I go to the new bookmark page
    When I fill in the following fields:
      | URL         | http://google.de |
      | Title       | Google Search |
      | Description | A search engine |
      | Tags        | search, google, awesome |
    And I press "Create Bookmark"
    Then I should see "Your bookmark has been created"

  @wip
  Scenario: User fills in wrong field, system should automagically correct
    Given I go to the new bookmark page
    When I fill in the following fields:
      | Title       | http://google.de        |
      | Tags        | search, google, awesome |
    And I press "Create Bookmark"
    Then I should see "Your bookmark has been created"

  Scenario: User adds empty bookmark
    Given I go to the new bookmark page
    When I press "Create Bookmark"
    Then I should see "URL can't be blank"

  @wip
  Scenario: User should see a wizard when she has no bookmarks
    Given I have no bookmarks
    When I go to the home page
    Then I should see "Add your first bookmark now"
