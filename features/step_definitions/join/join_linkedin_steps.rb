When(/^I click Join ParticipationList with LinkedIn$/) do
  on @site, :join_page do |joinpage|
    joinpage.click_linkedin
  end
end

When(/^I should able to see LinkedIn login page$/) do
  on @site, :join_page do |joinpage|
   puts joinpage.is_linkedin_page
  end
end

Then(/^I click Allow access link$/) do
  on @site, :join_page do |joinpage|
    joinpage.click_access
  end
end

Then(/^I should able to see the Account setup page$/) do
  on @site, :join_page do |joinpage|
   puts joinpage.is_account_page?
  end
end

Then(/^user join in as Linked in Email and password$/) do
 on @site, :join_page do |joinpage|
     @linked_user = User.get_user("linked_in_user")
    joinpage.login_with_linkedin(@linked_user)
  end
end

Then(/^I enter valid user details in Account setup page$/) do
  on @site, :join_page do |joinpage|
   joinpage.enter_linkedin_join_data(@linked_user)
  end
end

Then(/^I click on Select Bank from setup page$/) do
  on @site, :join_page do |joinpage|
   joinpage.click_bank_linkedin
  end
end

Then(/^home page for the LinkedIn user should be display$/) do
  on @site, :join_page do |joinpage|
  puts joinpage.verify_user_linkedin
  end
end
