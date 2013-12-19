#work in progress
@wip
Feature: Song Management
  As a record label owner
  I need to be able to add songs
  So that you know, I can sell them to people

  Background:
    Given I am logged in

  ##Arrange/Given
  #Act/When
  #Assert/Then
  Scenario: Adding Songs
    Given I am on the add songs page
    When I add "Yonkers"
    Then I should on on the all songs page
    And I should see  "Yonkers"

  Scenario: Adding Artist with Song
    Given I am on add songs page
    When I add "Song 2" by "Blur"
    Then I should see "Song 2" by "Blur" on the Playlist