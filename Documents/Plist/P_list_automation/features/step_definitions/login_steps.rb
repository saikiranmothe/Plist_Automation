Given(/^user click on Sign in button$/) do
  @site = "plist".downcase
  visit @site, :login_page
  on @site, :login_page do |loginpage|
    loginpage.click_signin
  end
end

Given(/^user logs in as "([^"]*)" and "([^"]*)"$/) do |username,password|
   on @site, :login_page do |loginpage|
    loginpage.login username,password
  end
end

Then(/^home page for the user "([^"]*)" should be displayed$/) do |username|
  on @site, :login_page do |loginpage|
   puts loginpage.verify_user username
  end
end

When(/^user logs out from application$/) do
  on @site, :login_page do |loginpage|
  loginpage.logout
  end
end

And(/^the user should be log out from the application$/) do
 on @site, :login_page do |loginpage|
  puts loginpage.is_logout?
  end
end

Given(/^that the user logged in as "(.*?)" and "(.*?)"$/) do |username, password|
   @site = "plist".downcase
  visit @site, :login_page
   on @site, :login_page do |loginpage|
    loginpage.click_signin
    loginpage.login username,password
  end
end
