Then(/^I should see 'Filter By Status' option$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.check_filters
  end
end

Then(/^I select 'Approved' status from the option$/) do
 on @site, :admin_page do |adminpage|
  puts adminpage.select_approved
  end
end

Then(/^I should able to see all the approved user in the table$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_active_users_list?
  end
end

Then(/^I select 'Blocked' status from the option$/) do
	on @site, :admin_page do |adminpage|
  puts adminpage.select_blocked
  end
end

Then(/^I should able to see all the blocked user in the table$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.is_blocked_users_list?
  end
end

Then(/^I select 'Locked' status from the option$/) do
  on @site, :admin_page do |adminpage|
  puts adminpage.select_locked
  end
end

Then(/^I should able to see all the locked user in the table$/) do
 on @site, :admin_page do |adminpage|
  puts adminpage.is_locked_users_list?
  end
end
