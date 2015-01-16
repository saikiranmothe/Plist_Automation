@admin
@admin_role
Feature: Make a common user as admin & remove his admin role
         As an admin user, I can add admin role to common user 
         and remove admin role from user

Background:
    Given I login as an admin user
    Then home page for the admin should be display
    Given I go to Manage users tab
    Then I search for the common user "cucumber8"

@make_admin_role
Scenario: I add admin role to common user
    And I should see Make Admin button for user
    When I press button 'Make Admin' for user
    Then I search for the common user "cucumber8"
    Then I should see 'Remove Admin' Role button for user
    When admin logs out from application
    Given I login as an common user
    Then home page for the user name should be display
    Then I should be able to see the Admin Notification
  
@remove_admin_role
Scenario: I remove admin role from common user
    And I should see Remove Admin Role button for user
    When I press button 'Remove Admin Role' for user
    Then I search for the common user "cucumber8"
    Then I should see 'Make Admin' Role button for user
    When admin logs out from application
    Given I login as an common user
    Then home page for the user name should be display
    Then I should be able to see the Remove Admin Notification
    #When admin logs out from application