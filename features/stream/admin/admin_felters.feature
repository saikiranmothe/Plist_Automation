@admin
@admin_filters
Feature: Admin Filter the users by using Filter by Status option
         As an admin user
         I can able to filter the users by status
  
Background:
    Given I login as an admin user
    Then home page for the admin should be display
    Given I go to Manage users tab
    Then I should see 'Filter By Status' option

@filter_by_status
Scenario: Admin Filter the users by Status
    Then I select 'Approved' status from the option
    And I should able to see all the approved user in the table
    Then I select 'Blocked' status from the option
    And I should able to see all the blocked user in the table
    Then I select 'Locked' status from the option
    And I should able to see all the locked user in the table
    When admin logs out from application