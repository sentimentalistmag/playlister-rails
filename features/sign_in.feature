Feature: Sign In
  As a user
  I need to be able to sign in

  Scenario: Signing in
    Given I exist as a user
    And I am on the signin page
    When I signin with valid credentials
    Then I should be signed in  and on the jukebox library page