@smoke_create_and_participate_opp
@participate_opp
Feature: Participate in an opportunity
   As a AA user
   I should be able to search an opportunity
   So that I can participate in opportunity 

@participation_new
  Scenario: User participate in new opportunity
   Given I login as another AA user
   Given I search for Opportunity by Id
   When I should see the opportunity details
   Then I click on Request Loan Package button
   Then user logs out from application