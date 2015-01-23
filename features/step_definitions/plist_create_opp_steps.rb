Then(/^I should see the create opportunity option from the main menu$/) do
  @site = "plist".downcase
  visit @site, :create_opp_page
  on @site, :create_opp_page do |create_opp|
  puts create_opp.create_opp  
  end  
end

When(/^I click on main menu button$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I should be able to see the create opportunity option$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I click on create opportunity option$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I see the select opportunity type popup$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I click on Participation New radio button$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I click on confirm button$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I should be able to see the new opportunity created$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

When(/^I click on edit icon for originator$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I should see all the fields editable$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I click and select loan originator value$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I click and select lender value$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I click on save button$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I should see the originator details are updated$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

When(/^I click on edit icon for borrower$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I should see all the borrower fields editable$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I update all the mandatory fields$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I should see the borrower details are updated$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

When(/^I click on edit icon for description$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I should see all the description fields editable$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I update all the required fields$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I should see the description details are updated$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

When(/^I click on edit icon for statistics$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I should see all the statistics fields editable$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I should see the statistics fields are updated$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

When(/^I click on edit icon for preliminary underwriting$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I should see the preliminary underwriting fields are updated$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

When(/^I click on the document tab$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I should be able to see new document button and New Folder button$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I click on new document button$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end 
end

Then(/^I should see the new document popup with add file button$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end
end

Then(/^I click on add files button$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
 end
end

Then(/^I should be able to see the navigation window to select document$/) do
  pending # express the regexp above with the code you wish you had
 end

Then(/^I click to select file$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I click open to upload the file$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be able to see the file is uploaded$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I click to add description$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I click done button to complete document upload$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be able to see the new document is uploaded in the document tab$/) do
  pending # express the regexp above with the code you wish you had
end