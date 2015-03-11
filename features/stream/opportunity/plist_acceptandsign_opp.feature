@aa_user1
@acceptandsign_opp
Feature: accept reservation
   
   I should be able to search an opportunity
   So that I can participate in opportunity 

Scenario: User accept participation and sign agreement
   Given I login as AA user
   Given I search for Opportunity by Id
   When I should see the opportunity details
   Then I accept reservation and sign agreement
   Then user logs out from application
   
Scenario: Participant sign agreement
   Given I login as another AA user
   Given I search for Opportunity by Id
   When I should see the opportunity details
   Then I click Sign agreement
   