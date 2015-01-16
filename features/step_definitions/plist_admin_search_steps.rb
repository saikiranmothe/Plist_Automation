Then(/^I should see 'Search' field$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.seach_field
  end
end

Then(/^I search for the common user by mail "(.*?)"$/) do |mail|
  on @site, :admin_page do |adminpage|
  puts adminpage.search_by_mail mail
  end
end

Then(/^I should able to see user in the table$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_search_user?
end
end

Then(/^I should able to see user name in the table$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_search_mail?
end
end