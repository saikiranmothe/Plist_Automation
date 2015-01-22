Then(/^I go to Manage users tab$/) do
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

Then(/^I should see Make Admin button for user$/) do
  on @site, :admin_page do |adminpage|
  pending puts "User Already in Admin Role" if adminpage.verify_role_bef.include? "Admin"
  puts adminpage.check_make_admin
  end
end

When(/^I press button 'Make Admin' for user$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.click_make_admin
  end
end

Then(/^I should see 'Remove Admin' Role button for user$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_admin?
  end
end

Then(/^I should see Remove Admin Role button for user$/) do
 on @site, :admin_page do |adminpage|
  pending puts "User not in admin role to remove" if adminpage.verify_role_bef.include? "User"
  puts adminpage.check_remove_admin
  end
end

When(/^I press button 'Remove Admin Role' for user$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.click_remove_admin
  end
end

Then(/^I should see 'Make Admin' Role button for user$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_removed_admin?
  end
end
