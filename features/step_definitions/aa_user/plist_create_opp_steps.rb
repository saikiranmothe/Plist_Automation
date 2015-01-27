Then(/^I should see the create opportunity option from the main menu$/) do
  @site = "plist".downcase
  visit @site, :create_opp_page
  on @site, :create_opp_page do |create_opp|
  create_opp.create_opp  
end
end

Then(/^I should be able to see the create opportunity popup$/) do
   on @site, :create_opp_page do |create_opp|
  puts create_opp.verify_popup
  end 
end

Then(/^I click on Participation New radio button$/) do
  on @site, :create_opp_page do |create_opp|
  create_opp.click_new_opp
  end 
end

Then(/^I should be able to see the new opportunity created$/) do
  on @site, :create_opp_page do |create_opp|
  puts create_opp.verify_opp
  end 
end

When(/^I click on edit icon for originator$/) do
  #@site = "plist".downcase
  #visit @site, :create_opp_page
  on @site, :create_opp_page do |create_opp|
  create_opp.click_statistics
  end
end

Then(/^I should see all the fields editable(.*)$/) do
  on @site, :create_opp_page do |create_opp|
  #@statistics = Statistics.get_user("statistics")
  create_opp.edit_statistics loantype
  end 
end
Then(/^I should see all the fields editable Commercial Real Estate: Term$/) do
  pending # express the regexp above with the code you wish you had
end


# Then(/^I should be able to see the new opportunity created$/) do
#   on @site, :edit_user_details_page do |edituser|
#   puts edituser.click_edit_button
#   end 
# end

When(/^I click on Documents$/) do
  on @site, :create_opp_page do |create_opp|
  create_opp.document
  end
end

Then(/^I click on new doc$/) do
   on @site, :create_opp_page do |create_opp|
  create_opp.newdoc
  end
end

Then(/^I click on Add files$/) do
   on @site, :create_opp_page do |create_opp|
  create_opp.addfile
  end
end

