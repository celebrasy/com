Feature: Points can be scored

  Scenario: You can submit points
    Given the BadCeleb League seeds have been run
    When I submit points for a player (team)
    Then I should see the points for that player

  Scenario: You can submit points (team)
    Given the BadCeleb League seeds have been run
    When I submit points for a player (team)
    Then I should see the points for that player

  Scenario: You can submit points (league)
    Given the BadCeleb League seeds have been run
    When I submit points for a player (league)
    Then I should see the points for that player

  Scenario: You can see group point breakdowns
    Given the BadCeleb League seeds have been run
    And one team has a bunch of points
    When I go to that team
    Then I should see each player's points broken down by group

  Scenario: You can see the league's points
    Given the BadCeleb League seeds have been run
    And one team has a bunch of points
    When I go to that league's points page
    Then I should see all the points

  Scenario: You can see team point totals
    Given the BadCeleb League seeds have been run
    And one team has a bunch of points
    When I go to that team
    Then I should see the point totals

  Scenario: You can see league team point totals
    Given the BadCeleb League seeds have been run
    And one team has a bunch of points
    When I go to that league's teams
    Then that team should be ranked first
