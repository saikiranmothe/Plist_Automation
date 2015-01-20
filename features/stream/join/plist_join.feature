@aa_user
@join
Feature: Join pList
  As user, 
  I should be able to create a new account by selecting a bank 
  So that I can access the Application 

@scenario_join_aa_user
Scenario: Join pList and become AA user 
   Given I click on Join button 
   When I click on CREATE A NEW ACCOUNT link
   Then I enter valid user details
   Then I click on Select Bank from Join ParticipationList page
   Then I select a bank from the list of banks
   Then check the checkbox for authorization request
   Then I click on Join ParticipationList button
   Then home page for the new user name should be display
   #When user logs out from application

