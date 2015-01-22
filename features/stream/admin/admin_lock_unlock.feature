@dmin
@admin_status
Feature: Make an user account Lock, Unlock and Active
         As an admin user, I can change the user ststus
         to Lock, Unlock and Active
         
Background:
    Given I go to Manage users tab
    Then I search for the common user "qwinixqa2"
    Then I should see Edit button

@lock_admin
Scenario: Lock user account 
    When I select 'Lock' for user
    Then I should see 'Lock' status for user
    #Then user logs out from application
    #Given I login as AA user
    #Then I should not able to login the application
      
@block_admin
Scenario: Deactivate user account 
    When I select 'Deactivated' for user
    Then I should see 'Deactivated' status for user
    #Then user logs out from application
    #Given I login as AA user
    #Then I should not able to login the application

@unlock_admin
Scenario: Active user account 
    When I select 'Active' for user
    Then I should see 'Active' status for user
    #Then user logs out from application
    #Given I login as AA user
    #Then I should see the home page with user name displayed
   