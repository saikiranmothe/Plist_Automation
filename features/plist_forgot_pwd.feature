@smoke
@forgot_pwd
Feature: Forgot User Password
         As a user
         I click Forgot Password and enter email from homepage
         So that user can get the Forgot password Email

Scenario: Forgot User Password with empty email
    Given I click on Forgot Password?
    When I enter Empty email
    Then I should not see banner message

Scenario Outline: Forgot User Password with valid/invalid email format
    Given I click on Forgot Password?
    When I enter <email>
    Then I should see banner message

#Scenario Outline: Forgot User Password with Invalid email format
    Given I click on Forgot Password?
    When I enter invalid <email1>
    Then I should not see banner message


 Examples:
 |email             | email1            |
 |ssqwinix@gmail.com| jhgfjhkjhhjhfjhgfh|

 