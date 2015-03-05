@smoke 
Feature: Login
   As a user
   I should be able login as existing user
   So that I can use P_list application

  @login
  Scenario: User login for the first time
    Given I login as AA user
    Then I should see the home page with user name displayed
    Then user logs out from application
    Then the user should be log out from the application

  @smoke_login_linkedin
  Scenario: User login for the first time using Linkedin
    Given I click Sign In to ParticipationList with LinkedIn
    Then user login as LinkedIn
    Then I click Allow access link
    Then home page for the LinkedIn user should be display
    Then user logs out from application