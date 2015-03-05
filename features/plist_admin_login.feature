@admin
@smoke 
Feature: Admin Login
   As a user
   I should be able login as Admin
   So that I can use P_list application


@login_admin
  Scenario: Admin user login
    Given I login as an admin user
    Then home page for the admin should be display
    #Then user logs out from application
    #Then the user should be log out from the application