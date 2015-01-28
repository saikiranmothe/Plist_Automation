@create_opp
Feature: Create and publish New Opportunity
   As a AA user
   I should be able to create new opportunity
   So that I can publish the opportunity in the application

#Background:
   #Given I login as AA user

@create_participnew
  Scenario Outline: User create a new opportunity and publish
   Given I should see the create opportunity option from the main menu
   When I should be able to see the create opportunity popup
   Then I click on Participation New radio button
   Then I should be able to see the new opportunity created

   # #Edit Originator
   # When I click on edit icon for originator
   # Then I fill the originator details <loan_origin> and <lender>
   # Then I Save the changes
   # Then I should see the changes

   # #Edit Borrower details
   # When I click on edit icon for borrower
   # Then I Enter the borrwoer <borrower_name>
   # Then I Select Type of <entity>
   # And I Select State of Incorporation <state>
   # Then I Enter Address line <address>
   # Then I Enter the city <city>
   # Then I Enter the state <state>
   # Then I Enter the code <zipcode>
   # Then I Save the changes
   # Then I should see the Borrower detail changes

  #Edit Description
   When I click on edit icon for Description
   When I Enter Loan narrative "New...." and Borrower general "New...."
   Then I Save the changes
   Then I should see the Description changes

  # #Edit_statistics
  #  When I click on edit icon for statistics
  #  Then I select Loan Type ""
  #  Then I select Loan Sub Type ""
  #  Then I update all the mandatory fields
  #  Then I select Bank Assessed Loan Quality ""
  #  Then I Save the changes
  #  Then I should see the statistics fields are updated

  # #Edit_preliminary
  #  When I click on edit icon for preliminary underwriting
  #  Then I should see all the fields editable
  #  Then I update all the required fields
  #  Then I Save the changes
  #  Then I should see the preliminary underwriting fields are updated

  # #Document
  #  When I click on Documents
  #  Then I click on new doc
  #  Then I click on Add files

Examples:
| loan_origin | lender   | borrower_name | entity      | state | address | city   | zipcode |
| qwinixqa2   | qwinixqa | qwinixqa1     | Corporation | Iowa  | No 1    | mysore | 563101  |
