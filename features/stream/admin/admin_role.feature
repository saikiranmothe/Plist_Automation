@admin
@admin_role
Feature: Admin provides different user permissions
         As an admin user, 
         I can give various permissions to users
       
Background:
    Then I go to Manage users tab
    Then I should see 'Search' field
    Then I search for the common user "cucumber8"

@make_admin_role
Scenario: I add admin role to common user
    Then I should see Make Admin button for user
    When I press button 'Make Admin' for user
    Then I search for the common user "cucumber8"
    Then I should see 'Remove Admin' Role button for user
 
@remove_admin_role
Scenario: I remove admin role from common user
    Then I should see Remove Admin Role button for user
    When I press button 'Remove Admin Role' for user
    Then I search for the common user "cucumber8"
    Then I should see 'Make Admin' Role button for user