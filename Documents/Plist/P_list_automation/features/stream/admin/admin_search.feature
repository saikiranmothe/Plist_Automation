@admin_search
Feature: Admin Search the users by Nmae and Email
         As an admin user
         I can able to search the users by Nmae and Email
  
Background:
    Given I login as an admin user
    Then home page for the admin should be display

@admin_search_name
Scenario: Admin search the users by Name
    Given I go to Manage users tab
    Then I should see 'Search' field
    Then I search for the common user "cucumber8"
    And I should able to see user in the table
    Then I search for the common user by mail "qaautomation@yopmail.com"
    And I should able to see user name in the table
    When admin logs out from application