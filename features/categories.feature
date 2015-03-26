Feature: Categories
  As an admin
  I want to create a new category
  So I can better organize my blogs

  Background:
    Given the blog is set up
    Given I am logged into the admin panel

  Scenario:
    Given I am on the admin home page
    When I follow "Categories"
    Then I should be on the categories page
    Then I should see "Description"
    Then I should see "Categories"