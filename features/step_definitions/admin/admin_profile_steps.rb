Then(/^I click on 'My Profile'$/) do
	@site = "plist".downcase
    visit @site, :admin_page
	on @site, :admin_page do |adminpage|
    adminpage.my_profile
  end
end
    
Then(/^Profile file should be dispaly$/) do
	on @site, :admin_page do |adminpage|
    puts adminpage.is_my_profile?
  end
end