@smoke_create_and_participate_opp
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
   Then user logs out from application

Scenario: Admin record payment
   Given I login as an admin user
   Then I go to Manage Opportunities tab
   Then I search for Opportunity id
   Then I click on record payment
   Then user logs out from application

Scenario: Participant Disburse funds
   Given I login as another AA user
   Given I search for Opportunity by Id
   When I should see the opportunity details
   Then I click Disburse Funds
   Then user logs out from application

Scenario: Admin record disbursement
   Given I login as an admin user
   Then I go to Manage Opportunities tab
   Then I search for Opportunity id
   Then I click on record Disbursement
