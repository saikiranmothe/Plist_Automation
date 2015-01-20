Given(/^I click on Sign in button$/) do
  @site = "plist".downcase
  visit @site, :login_page
  on @site, :login_page do |loginpage|
    loginpage.click_signin
end
end

Given(/^I login as aa user$/) do
  steps %Q{
   Given I click on Sign in button 
  }
 on @site, :login_page do |loginpage|
  @commonuser = Common_user.get_user("common_user")
  loginpage.login(@commonuser)
end
end

Then(/^I should see the home page with user name displayed$/) do
  on @site, :login_page do |loginpage|
  loginpage.verify_user(@commonuser)
end
end

When(/^I click Sign In to ParticipationList with LinkedIn$/) do
 on @site, :login_page do |loginpage|
  loginpage.click_linkedin_sign
end
end
