@admin
@admin_user_reg
Feature: Admin disable/Enable the user registration
         As an admin user
         I can able to disable the user registration
         So that user should't able to register

@admin_enable_user_reg
Scenario: Enable the user registration
    Given I go to Manage users tab
    When I Disable user registration
    Then user logs out from application
    Then New user should not able to register with the Plist

@admin_dinable_user_reg
Scenario: Disable the user registration
    Given I login as an admin user
    Given I go to Manage users tab
    When I Enable user registration
    Then user logs out from application
    Then New user should able to register with the Plist