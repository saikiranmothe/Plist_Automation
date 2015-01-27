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
    
#Scenario Outline:
    When I click on edit icon for originator
    Then I should see all the fields editable<loantype>
  #  Then I click and select loan originator value
  #  Then I click and select lender value
  #  And I click on save button
  #  Then I should see the originator details are updated

Examples:
|loantype|
|Commercial Real Estate: Term|

  # @edit_borrower
  # Scenario:
  #  When I click on edit icon for borrower
  #  Then I should see all the borrower fields editable
  #  Then I update all the mandatory fields
  #  And I click on save button
  #  Then I should see the borrower details are updated

  # @edit_description
  # Scenario:
  #  When I click on edit icon for description
  #  Then I should see all the description fields editable
  #  Then I update all the required fields
  #  And I click on save button
  #  Then I should see the description details are updated

  # @edit_statistics
  # Scenario:
  #  When I click on edit icon for statistics
  #  Then I should see all the statistics fields editable
  #  Then I update all the mandatory fields
  #  And I click on save button
  #  Then I should see the statistics fields are updated

  # @edit_preliminary
  # Scenario:
  #  When I click on edit icon for preliminary underwriting
  #  Then I should see all the fields editable
  #  Then I update all the required fields
  #  And I click on save button
  #  Then I should see the preliminary underwriting fields are updated

  # @new_document
  # Scenario:
  #  When I click on the document tab
  #  Then I should be able to see new document button and New Folder button
  #  Then I click on new document button
  #  Then I should see the new document popup with add file button
  #  Then I click on add files button
  #  Then I should be able to see the navigation window to select document
  #  Then I click to select file 
  #  And I click open to upload the file
  #  Then I should be able to see the file is uploaded
  #  Then I click to add description
  #  Then I click done button to complete document upload
  #  Then I should be able to see the new document is uploaded in the document tab


  # Scenario:
  #   When I click on Documents
  #   Then I click on new doc
  #   Then I click on Add files