@login
Feature: Login
   As a user
   I should be able login as existing user
   So that I can use P_list application

  @smoke_login
  Scenario: User login for the first time
    #Given I click on Sign in button 
    Given I login as an common user
    Then home page for the user name should be display
    When user logs out from application
    And the user should be log out from the application

  @smoke_login_linkedin
  Scenario: User login for the first time using Linkedin
    Given I click on Sign in button 
    When I click Sign In to ParticipationList with LinkedIn
    Then user join in as Linked in Email and password
    Then I click Allow access link
    Then home page for the LinkedIn user should be display
