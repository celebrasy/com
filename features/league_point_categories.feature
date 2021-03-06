Feature: Leagues have Point Categories

  Scenario: You can see a league's point categories
    Given the BadCeleb League seeds have been run
    When I go to that league's scoring page
    Then I should see the BadCeleb point categories

  Scenario: You can filter a league's point categories
    Given the BadCeleb League seeds have been run
    When I go to that league's scoring page
    And I filter the table by "Death"
    Then I should only see the "Death" point categories
