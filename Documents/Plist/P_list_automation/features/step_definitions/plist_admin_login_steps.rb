Given(/^I login as an admin user$/) do
  steps %Q{
   Given I click on Sign in button 
  }
  on @site, :admin_page do |adminpage|
  @adminuser = Admin_user.get_user("admin")
  adminpage.admin_login(@adminuser)
  end
end

Then(/^home page for the admin should be display$/) do
  on @site, :admin_page do |adminpage|
  adminpage.verify_home
  end
end

When(/^admin logs out from application$/) do
  on @site, :admin_page do |adminpage|
  adminpage.logout_admin_user
  end
end

And(/^the admin user should be log out from the application$/) do
   on @site, :admin_page do |adminpage|
   puts adminpage.is_logout_admin?
   end
end