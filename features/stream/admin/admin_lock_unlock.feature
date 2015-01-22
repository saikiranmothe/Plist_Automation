@admin_lock_active_deactive
Feature: Make a common user account Lock & Unlock
         As an admin user, I can Lock a common user account
         and I can Unlock a common user account

Background:
    Given I login as an admin user
    When home page for the admin should be display
    Then I go to Manage users tab
    Then I search for the common user "cucumber8"
    Then I should see Edit button

@lock_admin
Scenario: I Lock common user account 
    When I select 'Lock' for user
    Then I should see 'Lock' status for user
    Then admin logs out from application
    Then I login as an common user
    Then I should not able to login the application
      
@block_admin
Scenario: I Lock common user account 
    And I should see Edit button for user to Deactivate
    When I select 'Deactivated' for user
    Then I should see 'Deactivated' status for user
    When admin logs out from application
    Given I login as an common user
    Then I should not able to login the application

@unlock_admin
Scenario: I Unlock common user account 
    And I should see Edit button for user to Active
    When I select 'Active' for user
    Then I should see 'Active' status for user
    When admin logs out from application
    Given I login as an common user
    Then I should able to login the application
    #When user logout from application
    When user logs out from application