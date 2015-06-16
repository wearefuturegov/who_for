Feature: Create a profile
  As a visitor
  I should be able to create a new persona

  Background:
    Given I visit the homepage
    Given I click the link "Add new profile"

  Scenario: I should see the form
    Then I should be able to create a persona

  Scenario: Create a new persona
    Given I fill in the profile fields
    Then I should see the persona
