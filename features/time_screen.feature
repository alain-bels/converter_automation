@time
Feature: User able to convert time units

  Background:
    Given I click on Got it button
    When I land on "Area" screen
    And I swipe in the menu
    And I select "Time" from menu
    Then I land on "Time" screen

  Scenario Outline: User is able to convert time units
    Given I click on Clear button
    When I select "<time_unit_from>" to From list
    And I enter "<target>" to From field
    And I select "<time_unit_to>" to To list
    Then I get "<result>" in To field

    Examples:
      | time_unit_from | target | time_unit_to | result |
      | Day            | 5      | Year         | 0.0137 |
      | Day            | 10     | Month        | 0.3288 |
      | Day            | 15     | Week         | 2.1429 |