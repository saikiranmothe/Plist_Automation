Then(/^I should able to see user in the table$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_search_user?
end
end

Then(/^I should be able to see 'Authorize' button$/) do
 on @site, :admin_page do |adminpage|
pending "Authorized user " if adminpage.verify_role_bef.include? "Authorized Affiliated User"
pending "User has not send an Authorization request" if adminpage.verify_role_bef.include? "Affiliated User" 
puts adminpage.check_auth_button
puts adminpage.click_button
end
end

Then(/^I enter verification logs "(.*?)"$/) do |enter_log|
  on @site, :admin_page do |adminpage|
  puts adminpage.check_verification_logs enter_log
end
end

Then(/^I click Authorize button$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.click_verify_auth
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

