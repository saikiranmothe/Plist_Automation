@admin
@admin_auth
Feature: Admin Search the users by Name and Email
         As an admin user
         I can able to search the users by Nmae and Email
  
@admin_authrize_request
Scenario: Admin search the users by Name
    Then I go to Manage users tab
    Then I should see 'Search' field
    Then I search for the common user "qwinixqa2"
    Then I should able to see user in the table
    And I should be able to see 'Authorize' button
    Then I enter verification logs "Is done"
    And I click Authorize button
    Then I search for the common user "qwinixqa2"
    Then I should see the role Authorized Affiliated User
    #Then user logs out from application
    #Given I login as AA user
    #Then I should see the home page with user name displayed
    #Then I should be able to see the Notification