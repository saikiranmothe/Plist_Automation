Then(/^I verify user locked before$/) do
 on @site, :admin_page do |adminpage|
  pending puts "User Already Locked" if adminpage.check_user_status_bef.include? "Locked"
  end 
end

Then(/^I should see Edit button for user to Lock$/) do
  steps %Q{
   Then I verify user locked before
  }
  on @site, :admin_page do |adminpage|
  adminpage.check_edit_button
  end
end

When(/^I select 'Lock' for user$/) do
  on @site, :admin_page do |adminpage|
  adminpage.select_lock
  end
end

Then(/^I should see 'Lock' status for user$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_user_locked?
  end
end

Then(/^I verify user active before$/) do
 on @site, :admin_page do |adminpage|
  pending puts "User in Avtive status" if adminpage.check_user_status_bef.include? "Active"
  end
end 

Then(/^I should see Edit button for user to Active$/) do
  steps %Q{
   Then I verify user active before
  }
  on @site, :admin_page do |adminpage|
  adminpage.click_edit_button_active
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

Then(/^I verify user Deactivated before$/) do
 on @site, :admin_page do |adminpage|
  pending puts "User Already Deactivated" if adminpage.check_user_status_bef.include? "Deactivated"
  end
  end

Then(/^I should see Edit button for user to Deactivate$/) do
  steps %Q{
   Then I verify user Deactivated before
  }
  on @site, :admin_page do |adminpage|
  puts adminpage.click_edit_button_deactive
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