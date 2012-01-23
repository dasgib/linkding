Feature: Import bookmarks
  In order to continue using my old bookmarks
  As a new user
  I want to be able to import my old bookmarks

  Background:
    Given I am signed in

  Scenario: Press Upload without attaching a file
    Given I go to the import page
    When I press "Upload"
    Then I should see "File can't be blank"

  Scenario: Import bookmarks
    Given I have no bookmarks
    And I go to the import page
    When I attach the file "features/files/delicious.html" to "File"
    And I press "Upload"
    Then I should see "5 bookmarks successfully imported"
    And I should have 5 bookmarks
    And I should see 5 bookmarks
    And I should see "Log.io - Real-time log monitoring in your browser"
    And I should see "http://logio.org"
    And I should see "TextboxList | Guillermo Rauch's Devthought"
    And I should see "http://www.devthought.com/projects/mootools/textboxlist/"
    And I should see "tags (2)"
    And I should see "mootools (1)"
    And I should see "rails (1)"

  Scenario: Import bookmarks twice
    Given I have no bookmarks
    And I go to the import page
    And I attach the file "features/files/delicious.html" to "File"
    And I press "Upload"
    And I go to the import page
    When I attach the file "features/files/delicious.html" to "File"
    And I press "Upload"
    Then I should see "0 bookmarks successfully imported, 5 skipped because of errors."
    And I should see 5 bookmarks
