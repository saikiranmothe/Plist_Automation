@user_details
Feature: Edit user profile
As a registered user
I should be able edit my profile page
So that I can see the updated details

Background:
Given I login as aa user
Then I should see the home page with user name displayed

@edit_authorize
Scenario: User login and edit profile
When I click on edit profile
Then check the checkbox for authorization request
Then I click on Save Profile
When user logs out from application