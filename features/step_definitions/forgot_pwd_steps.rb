Given(/^I click on Forgot Password\?$/) do
  @site = "plist".downcase
  visit @site, :login_page
  on @site, :login_page do |loginpage|
  loginpage.click_forgot_pwd_link
  end
end

When(/^I Enter (.*)$/) do |email|
  on @site, :login_page do |loginpage|
  loginpage.enter_mail email
  end
end

When(/^I enter invalid (.*)$/) do |email1|
   on @site, :login_page do |loginpage|
  loginpage.enter_mail email1
  end
end

When(/^I enter Empty email$/) do
   on @site, :login_page do |loginpage|
  loginpage.empty
  end
end


Then(/^I should see banner message$/) do
  on @site, :login_page do |loginpage|
 puts loginpage.verify_msg
  end
end

Then(/^I should not see banner message$/) do
  on @site, :login_page do |loginpage|
 puts loginpage.invalid_msg
  end
end