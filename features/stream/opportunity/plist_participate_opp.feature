@aa_user1
@participate_opp
Feature: Participate in an opportunity
   As a AA user
   I should be able to search an opportunity
   So that I can participate in opportunity 

Background:
  Given I login as another AA user to participate

@participation_new
  Scenario Outline: User participate in new opportunity
   Given I search for Opportunity by Id
   When I should see the opportunity details
   Then I click on Request Loan Package button
   # Then I should be able to see the Documents 
   # When I click on participate button
   # Then I fill the participation <amount>
   # Then I click on participate 
   # Then I should see my reservation
   # Then user logs out from application
 
   Examples:
   | amount |
   | 8000000 |

   #Edit Borrower details
   # When I click on edit icon for borrower
   # Then I Enter the borrwoer <borrower_name>
   # Then I Select Type of <entity>
   # And I Select State of Incorporation <state>
   # Then I Enter Address line <address>
   # Then I Enter the city <city>
   # Then I Enter the state <state>
   # Then I Enter the code <zipcode>