Given(/^I login as AA user$/) do
  @site = "plist".downcase
  visit @site, :login_page
  on @site, :login_page do |loginpage|
  @commonuser = Common_user.get_user("common_user")
  loginpage.click_signin
  loginpage.login(@commonuser)
end
end

Then(/^I should see the home page with user name displayed$/) do
  on @site, :login_page do |loginpage|
 puts loginpage.verify_user(@commonuser)
end
end


Then(/^I login as an admin user$/) do
  @site = "plist".downcase
  visit @site, :login_page
  on @site, :login_page do |loginpage|
  @adminuser = Admin_user.get_user("admin")
  loginpage.admin_login(@adminuser)
  end
end

Then(/^home page for the admin should be display$/) do
  on @site, :login_page do |loginpage|
 puts loginpage.verify_admin
end
end


Then(/^I click Sign In to ParticipationList with LinkedIn$/) do
 @site = "plist".downcase
 visit @site, :login_page
 on @site, :login_page do |loginpage|
  loginpage.click_signin
  loginpage.click_linkedin_sign
end
end

Then(/^user login as LinkedIn Email "(.*?)" and password "(.*?)"$/) do |email, pwd|
 on @site, :login_page do |loginpage|
  loginpage.signin_with_linkedin email,pwd
end
end

When(/^user logs out from application$/) do
  on @site, :login_page do |loginpage|
  loginpage.logout
  end
end

Then(/^the user should be log out from the application$/) do
   on @site, :login_page do |loginpage|
   puts loginpage.is_logout?
   end
end



