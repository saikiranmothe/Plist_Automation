@smoke
@forgot_pwd
Feature: Forgot User Password
         As a user
         I click Forgot Password and enter email from homepage
         So that user can get the Forgot password Email

Scenario Outline: Forgot User Password with valid email format
    Given I click on Forgot Password?
    When I Enter valid <email>
    Then I should see banner message

# Scenario Outline: Forgot User Password with Invalid email format
#     Given I click on Forgot Password?
#     When I Enter valid <email>
#     Then I should see banner message


 Examples:
 |email|
 |ssqwinix@gmail.com|
