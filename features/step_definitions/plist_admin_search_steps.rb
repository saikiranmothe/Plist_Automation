Then(/^I should see 'Search' field$/) do
  #@site = "plist".downcase
  #visit @site, :admin_page
  on @site, :admin_page do |adminpage|
  puts adminpage.seach_field
  end
end

Then(/^I search for the common user by mail "(.*?)"$/) do |mail|
  on @site, :admin_page do |adminpage|
  puts adminpage.search_by_mail mail
  end
end

Then(/^I should able to see user in the table$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_search_user?
end
end

Then(/^I should able to see user name in the table$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_search_mail?
end
end

Then(/^I should be able to see 'Authorize' button$/) do
 on @site, :admin_page do |adminpage|
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

