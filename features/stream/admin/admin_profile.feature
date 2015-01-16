@admin
@admin_profile
Feature: Admin profile
         As an admin user
         I can able to see all the Dropdown options  

@admin_dropdown
Scenario: Admin profile
    Given I login as an admin user
    Then home page for the admin should be display
    Then I click on 'My Profile'
    Then Profile file should be dispaly
    When admin logs out from application
    