Then(/^I search for the AA user$/) do 
  on @site, :admin_page do |adminpage|
  @commonuser = User.get_user("default")
  adminpage.search_aa_user(@commonuser)
end
end


Then(/^I should able to see user in the table$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_search_user?(@commonuser)
end
end

Then(/^I search for the another AA user$/) do
on @site, :admin_page do |adminpage|
  @commonuser1 = User.get_user("second_aa_user")
  adminpage.search_aa_user(@commonuser1)
end
end

Then(/^I should able to see another user in the table$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_search_user?(@commonuser1)
end
end

Then(/^I should be able to see 'Authorize' button$/) do
 on @site, :admin_page do |adminpage|
  pending "Authorized user " if adminpage.verify_role_bef.include? "Authorized Affiliated User"
  pending "User has not send an Authorization request" if adminpage.verify_role_bef.include? "Affiliated User" 
  puts adminpage.check_auth_button
  adminpage.click_button
end
end

Then(/^I enter verification logs "(.*?)"$/) do |enter_log|
  on @site, :admin_page do |adminpage|
  adminpage.check_verification_logs enter_log
end
end

Then(/^I click Authorize button$/) do
  on @site, :admin_page do |adminpage|
  adminpage.click_verify_auth
end
end

Then(/^I should see the role Authorized Affiliated User$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_authorized
end
end

Then(/^I should be able to see the Notification$/) do
   on @site, :admin_page do |adminpage|
  puts adminpage.check_auth_notification
end
end

