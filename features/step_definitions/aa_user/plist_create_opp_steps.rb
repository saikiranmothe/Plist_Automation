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

Then(/^I fill the originator details (.*) and (.*)$/) do |loan_origin,lender|
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

#Edit Borrower######################################################################################################
When(/^I click on edit icon for borrower$/) do
 on @site, :create_opp_page do |create_opp|
 create_opp.click_borrower
end 
end

Then(/^I Enter the borrwoer (.*)$/) do |borrower_name|
 on @site, :create_opp_page do |create_opp|
 create_opp.enter_borrower borrower_name
end 
end

Then(/^I Select State of Incorporation (.*)$/) do |state|
  on @site, :create_opp_page do |create_opp|
 create_opp.incrop state
end 
end

Then(/^I Select Type of (.*)$/) do |entity|
 on @site, :create_opp_page do |create_opp|
 create_opp.type_entity entity
end 
end

Then(/^I Enter Address line (.*)$/) do |address|
 on @site, :create_opp_page do |create_opp|
 create_opp.enter_address address
end 
end

Then(/^I Enter the city (.*)$/) do |city|
 on @site, :create_opp_page do |create_opp|
 create_opp.enter_city city
end 
end

Then(/^I Enter the state (.*)$/) do |state|
 on @site, :create_opp_page do |create_opp|
 create_opp.enter_state state
end
end

Then(/^I Enter the code (.*)$/) do |zipcode|
  on @site, :create_opp_page do |create_opp|
 create_opp.enter_zipcode zipcode
end
end

Then(/^I should see the Borrower detail changes$/) do
  on @site, :create_opp_page do |create_opp|
 create_opp.verify_borrow_changes
end
end

#Edit Description######################################################################################################
When(/^I click on edit icon for Description$/) do
   on @site, :create_opp_page do |create_opp|
 create_opp.click_descrip
end
end

When(/^I Enter Loan narrative "(.*?)" and Borrower general "(.*?)"$/) do |ln, bg|
   on @site, :create_opp_page do |create_opp|
 create_opp.enter_description ln,bg
end
end

Then(/^I should see the Description changes$/) do
   on @site, :create_opp_page do |create_opp|
 create_opp.verify_descrip_changes
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

