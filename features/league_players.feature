Feature: Leagues have Players

  Scenario: You can see and filter a league's players
    Given the BadCeleb League seeds have been run
    When I go to that league's players page
    And I filter the table by "snooki"
    Then I should only see the "Snooki" player

  Scenario: Defaults to the best players
    Given the BadCeleb League seeds have been run
    And one team has a bunch of points
    When I go to that league's players page
    Then I should see the best player first

  Scenario: Players can be added
    Given the BadCeleb League seeds have been run
    When I go to that league's players page
    And I submit the add a player form
    And I filter the table by the new player's name
    Then I should see that new player

  Scenario: Players can be added with multiple positions
    Given the BadCeleb League seeds have been run
    When I go to that league's players page
    And I submit the add a player form with multiple positions
    And I filter the table by the new player's name
    Then I should see that new player
    And I should see both his positions
