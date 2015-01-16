Given(/^I go to Manage users tab$/) do
  @site = "plist".downcase
  visit @site, :admin_page
  on @site, :admin_page do |adminpage|
  adminpage.manage_users
  end
end

Then(/^I search for the common user "(.*?)"$/) do |user|
  on @site, :admin_page do |adminpage|
  puts adminpage.search_c_user user
  end
end

Then(/^I verify the user admin role$/) do
  on @site, :admin_page do |adminpage|
  pending puts "User Already in Admin Role" if adminpage.verify_role_bef.include? "Admin"
  end
end

Then(/^I should see Make Admin button for user$/) do
  steps %Q{
     Then I verify the user admin role
     }
  on @site, :admin_page do |adminpage|
  adminpage.check_make_addmin
  end
end

When(/^I press button 'Make Admin' for user$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.click_make_addmin
  end
end

Then(/^I should see 'Remove Admin' Role button for user$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_admin?
  end
end

Then(/^I verify the user role$/) do
  on @site, :admin_page do |adminpage|
  pending puts "User not in admin role to remove" if adminpage.verify_role_bef.include? "User"
  end
end

Then(/^I should see Remove Admin Role button for user$/) do
  steps %Q{
     Then I verify the user role
     }
  on @site, :admin_page do |adminpage|
  puts adminpage.check_remove_addmin
  end
end

When(/^I press button 'Remove Admin Role' for user$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.click_remove_addmin
  end
end

Then(/^I should see 'Make Admin' Role button for user$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_removed_admin?
  end
end

Then(/^I should be able to see the Admin Notification$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.check_admin_noti
 end
end

Then(/^I should be able to see the Remove Admin Notification$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.check_remove_admin_noti
 end
end
