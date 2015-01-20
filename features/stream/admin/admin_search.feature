
@admin_search
Feature: Admin Search the users by Name and Email
         As an admin user
         I can able to search the users by Nmae and Email
  
Background:
    Given I login as an admin user
    Then home page for the admin should be display

@admin_search_name
Scenario: Admin search the users by Name
    Given I go to Manage users tab
    Then I should see 'Search' field
    Then I search for the common user "qwinixqa2"
    Then I should able to see user in the table
    And I should be able to see 'Authorize' button
    Then I enter verification logs "Is done"
    And I click Authorize button
    Then I search for the common user "qwinixqa2"
    Then I should see the role Authorized Affiliated User
    When admin logs out from application
    Given I login as aa user
    Then I should see the home page with user name displayed
    Then I should be able to see the Notification