Then(/^I should see Edit button$/) do
  #@site = "plist".downcase
  #visit @site, :admin_page
  on @site, :admin_page do |adminpage|
  adminpage.check_edit_button
 end
end

When(/^I select 'Lock' for user$/) do
  on @site, :admin_page do |adminpage|
pending "User Already Locked" if adminpage.check_user_status_bef.include? "Locked"
  adminpage.click_edit_button
  adminpage.select_lock
  end
end

Then(/^I should see 'Lock' status for user$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_user_locked?
  end
end

When(/^I select 'Deactivated' for user$/) do
  on @site, :admin_page do |adminpage|
  pending puts "User Already Deactivated" if adminpage.check_user_status_bef.include? "Deactivated"
  adminpage.click_edit_button
  adminpage.select_block
  end
end

Then(/^I should see 'Deactivated' status for user$/) do
 on @site, :admin_page do |adminpage|
  puts adminpage.is_user_blocked?
  end
end

Then(/^I should not able to login the application$/) do
   on @site, :admin_page do |adminpage|
  puts adminpage.is_login?
  end
end

When(/^I select 'Active' for user$/) do
  on @site, :admin_page do |adminpage|
  pending puts "User in Avtive status" if adminpage.check_user_status_bef.include? "Active"
  adminpage.click_edit_button
  adminpage.select_active
  end
end

Then(/^I should see 'Active' status for user$/) do
 on @site, :admin_page do |adminpage|
  puts adminpage.is_user_approved?
  end
end