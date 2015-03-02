Given(/^I login as AA user$/) do
  @site = "plist".downcase
  visit @site, :login_page
  on @site, :login_page do |loginpage|
  #@commonuser = User.get_user("default")
  @commonuser = User.get_user("common_user")
  loginpage.click_signin
  loginpage.login(@commonuser)
end
end

Then(/^I should see the home page with user name displayed$/) do
  on @site, :login_page do |loginpage|
 puts loginpage.verify_user(@commonuser)
end
end


Given(/^I login as an admin user$/) do
  @site = "plist".downcase
  visit @site, :login_page
  on @site, :login_page do |loginpage|
  #@adminuser = Admin_user.get_user("admin")
  @adminuser = User.get_user("admin")
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

Then(/^user login as LinkedIn$/) do 
 on @site, :login_page do |loginpage|
  @linked = User.get_user("linkedin")
  loginpage.signin_with_linkedin(@linked)
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



