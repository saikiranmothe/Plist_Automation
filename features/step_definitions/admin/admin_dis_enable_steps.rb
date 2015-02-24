When(/^I Disable user registration$/) do
 on @site, :admin_page do |adminpage|
 adminpage.check_enable
 end
end

When(/^I Enable user registration$/) do
 on @site, :admin_page do |adminpage|
 adminpage.check_disable
 end	
end

Then(/^New user should not able to register with the Plist$/) do
 on @site, :admin_page do |adminpage| 
 puts adminpage.verify_user_reg
 end
end

Then(/^New user should able to register with the Plist$/) do
 on @site, :join_page do |joinpage|
 joinpage.click_join
 joinpage.click_create_account
 end
end
