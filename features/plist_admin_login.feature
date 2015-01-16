@admin_login
Feature: Admin Login
   As a Admin user
   I should be able login as existing user
   So that I can use P_list application

@smoke_login_admin
  Scenario: Admin user login 
    Given I login as an admin user
    Then home page for the admin should be display
    #When admin logs out from application
    #And the admin user should be log out from the application