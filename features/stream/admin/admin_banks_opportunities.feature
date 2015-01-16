@admin
@admin_banks_opp
Feature: Admin View all Opportunities Banks
         As an admin user
         I can able to see all the Opportunities and Banks

@admin_dropdown
Scenario: Admin View all Opportunities Banks
    Given I click on Sign in button 
    Given I login as an admin user
    Then home page for the admin should be display
    Given I go to Manage Banks tab
    Then I should see 'all the Banks' in the table
    Given I go to Manage Opportunities tab
    Then I should see 'all the Opportunities' in the table
    When admin logs out from application