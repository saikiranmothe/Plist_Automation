@admin
@admin_banks_opp
Feature: Admin View all Opportunities Banks
         As an admin user
         I can able to see all the Opportunities and Banks

@admin_dropdown
Scenario: Admin View all Opportunities Banks
    Then I go to Manage Banks tab
    Then I should see 'all the Banks' in the table
    Then I go to Manage Opportunities tab
    Then I should see 'all the Opportunities' in the table
    