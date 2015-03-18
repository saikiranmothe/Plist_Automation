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

Then(/^I fill the valid user details$/) do
  on @site, :join_page do |joinpage|
     @user = User.get_user("default")
    joinpage.enter_join_data(@user)
  end
end

Then(/^I click on Select Bank$/) do
   on @site, :join_page do |joinpage|
  joinpage.click_bank
  end
end

Then(/^I select a bank from the list of banks$/) do
   on @site, :join_page do |joinpage|
puts joinpage.select_bank
  end
end


Then(/^I fill the valid user details for another aa user$/) do
   on @site, :join_page do |joinpage|
     @second_user = User.get_user("second_aa_user")
    joinpage.enter_join_data(@second_user)
  end
end

Then(/^I select another bank$/) do
 on @site, :join_page do |joinpage|
  joinpage.select_another_bank
  end
end


Then(/^I check the authorization request$/) do
  on @site, :join_page do |joinpage|
  puts joinpage.click_checkbox 
  end
end

Then(/^I click on Join ParticipationList$/) do
  on @site, :join_page do |joinpage|
  joinpage.click_join_plist
  end
end

Then(/^Home page for the user should be display$/) do
  on @site, :join_page do |joinpage|
  puts joinpage.verify_user(@user)
  end  
end

Then(/^Home page for the another new user should be display$/) do
  on @site, :join_page do |joinpage|
  puts joinpage.verify_user(@second_user)
  end  
end

Then(/^I Upload an image$/) do
  on @site, :join_page do |joinpage|
  puts joinpage.upload_img 
  end
end
