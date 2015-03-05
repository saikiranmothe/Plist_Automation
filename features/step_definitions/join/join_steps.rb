Given(/^I click on Join button$/) do
  @site = "plist".downcase
  visit @site, :join_page
  on @site, :join_page do |joinpage|
  joinpage.click_join
  end
end

When(/^I click on CREATE A NEW ACCOUNT link$/) do
  on @site, :join_page do |joinpage|
  joinpage.click_create_account
  end
end

And(/^I enter valid user details$/) do
  on @site, :join_page do |joinpage|
     @user = User.get_user("default")
    joinpage.enter_join_data(@user)
  end
end

Then(/^I click on Select Bank from Join ParticipationList page$/) do
   on @site, :join_page do |joinpage|
  joinpage.click_bank
  end
end

Then(/^I select a bank from the list of banks$/) do
   on @site, :join_page do |joinpage|
  joinpage.select_bank
  end
end


Then(/^I click on Join ParticipationList$/) do
  on @site, :join_page do |joinpage|
  joinpage.click_join_plist
  end
end

Then(/^home page for the new user name should be display$/) do
  on @site, :join_page do |joinpage|
  puts joinpage.verify_user(@user)
  end  
end

Then(/^I check the authorization request$/) do
  on @site, :join_page do |joinpage|
  puts joinpage.click_checkbox 
  end
end

Then(/^I Upload an image$/) do
  on @site, :join_page do |joinpage|
  puts joinpage.upload_img 
  end
end