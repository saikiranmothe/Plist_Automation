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

#Edit originator######################################################################################################
When(/^I click on edit icon for originator$/) do
  on @site, :create_opp_page do |create_opp|
  create_opp.click_originator
  end
end

Then(/^I fill the originator details "([^\"]*)" and "([^\"]*)"$/) do |loan_origin,lender|
  on @site, :create_opp_page do |create_opp|
  create_opp.edit_originator loan_origin,lender
end 
end

Then(/^I Save the changes$/) do
  on @site, :create_opp_page do |create_opp|
  create_opp.click_save
end 
end

Then(/^I should see the changes$/) do 
  on @site, :create_opp_page do |create_opp|
 puts create_opp.verify_changes
end 
end




#######################################################################################################

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

######################################################################################################
When(/^I click on edit icon for borrower Soma L$/) do
  
end


Then(/^I Select Type of Entity cop$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I Select State of Incorporation shisd$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I Enter Address \(line (\d+)\) "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^I Enter city "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I Enter State shisd$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I Enter the Zip Code "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the Borrower detail changes$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I Enter Loan narrative "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I Enter Borrower general "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I update all the mandatory fields$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the Description changes$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click on edit icon for statistics$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I select Loan Type "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I select Loan Sub Type "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I select Bank Assessed Loan Quality "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the statistics fields are updated$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click on edit icon for preliminary underwriting$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see all the fields editable$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I update all the required fields$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the preliminary underwriting fields are updated$/) do
  pending # express the regexp above with the code you wish you had
end

