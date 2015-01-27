Then(/^I click on edit profile$/) do
  on @site, :edit_user_details_page do |edituser|
  puts edituser.click_edit_button
  end  
end

#Then(/^I verify the user is authorized$/) do
  #on @site, :edit_user_details_page do |edituser|
  #pending puts "User already requested authorization" unless edituser.verify_authorization_bef.exists?
 # end
#end

#Then(/^check the checkbox for authorization request$/) do
	#steps %Q{
	 #  Then I verify the user is authorized  
     #}
  #on @site, :edit_user_details_page do |edituser|
  #puts edituser.click_checkbox 
  #end
#end

Then(/^I click on Save Profile$/) do
 on @site, :edit_user_details_page do |edituser|
	puts edituser.click_save_profile
  end
end