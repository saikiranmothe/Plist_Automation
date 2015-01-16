Given(/^I go to Manage Banks tab$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.manage_banks
  end
end

Then(/^I should see 'all the Banks' in the table$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_banks?
  end
end

Given(/^I go to Manage Opportunities tab$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.manage_opp
  end
end

Then(/^I should see 'all the Opportunities' in the table$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_opp?
  end
end
