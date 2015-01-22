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
   Then user logs out from application

#@join_with_linked_in
#Scenario: User sign Up with Plist an existing LinkedIn user 
   #Given I click on Join button 
   #When I click Join ParticipationList with LinkedIn
   #And I should able to see LinkedIn login page
   #Then user join in as Linked in Email and password
   #Then I click Allow access link
   #Then I should able to see the Account setup page
   #Then I enter valid user details in Account setup page
   #Then I click on Select Bank from setup page
   #And I select a bank from the list of banks
   #Then I click on Join ParticipationList button
   #Then home page for the LinkedIn user should be display
   #When user logs out from application