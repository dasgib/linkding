Feature: Add bookmark
  As a user
  I want to be able to add a bookmark
  In order to have access to it at any time

  Scenario Outline: I want to see a "add link" button all the time
    Given I am signed in
    When I am on the <page> page
    Then I want to see "Add Bookmark"

    Examples:
      | page      |
      | dashboard |
      | home      |

  Scenario: User adds bookmark
    Given I am signed in
    And I go to the new bookmark page
    When I fill in the following fields:
      | address     | http://google.de        |
      | description | Awesome search engine   |
      | tags        | search, google, awesome |
    And I press "Create bookmark"
    Then I want to see "Your bookmark has been created"

  Scenario: User fills in wrong field, system should automagically correct
    Given I am signed in
    And I go to the new bookmark page
    When I fill in the following fields:
      | title       | http://google.de        |
      | tags        | search, google, awesome |
    And I press "Create bookmark"
    Then I want to see "Your bookmark has been created"

  Scenario: User adds empty bookmark
    Given I am signed in
    And I go to the new bookmark page
    And I press "Create bookmark"
    Then I want to see "Please enter a valid URL"

  Scenario: I want to access all my bookmarks
    Given I am signed in
    And I have bookmarks
    And I go to the home page
    Then I want to see "All bookmarks"

  Scenario: User should see a wizard when she has no bookmarks
    Given I am signed in
    And I have no bookmarks
    And I go to the home page
    Then I want to see "Add your first bookmark now"
