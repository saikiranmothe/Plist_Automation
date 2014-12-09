@login
Feature: Login
  As a user
  I should be able login as existing user
  So that I can use P_list application

  @smoke
  Scenario: User login for the first time
    Given user click on Sign in button 
    Then user logs in as "somashekar" and "Qwinix1234"
    Then home page for the user "somashekar" should be displayed
    When user logs out from application
    And the user should be log out from the application
