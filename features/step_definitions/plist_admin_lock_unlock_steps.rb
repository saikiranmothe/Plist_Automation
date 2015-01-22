Then(/^I should see Edit button$/) do
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

Then(/^I should see Edit button for user to Active$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.check_click_edit_button_active
  end
 end

When(/^I select 'Active' for user$/) do
  on @site, :admin_page do |adminpage|
  adminpage.select_active
  end
end

Then(/^I should see 'Active' status for user$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_user_approved?
  end
end

Then(/^I should see Edit button for user to Deactivate$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.check_click_edit_button_deactive
  end
 end

When(/^I select 'Deactivated' for user$/) do
  on @site, :admin_page do |adminpage|
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

Then(/^I should able to login the application$/) do
   on @site, :login_page do |loginpage|
  puts loginpage.verify_user(@commonuser)
end
end

When(/^user logout from application$/) do
  on @site, :admin_page do |adminpage|
  adminpage.logout
  end
end