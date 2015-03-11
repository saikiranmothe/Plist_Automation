Given(/^I search for Opportunity by Id$/) do
  @site = "plist".downcase
  visit @site, :participate_opp_page
  on @site, :participate_opp_page do |participate_opp|
  participate_opp.search_opp
 end
end

When(/^I should see the opportunity details$/) do
  on @site, :participate_opp_page do |participate_opp|
 puts participate_opp.opp_details
  end
end

Then(/^I click on Request Loan Package button$/) do
  on @site, :participate_opp_page do |participate_opp|
  puts participate_opp.share_opp
  puts participate_opp.follow_opp
  puts participate_opp.request_loanpkg
  puts puts participate_opp.verify_req
  participate_opp.participate_opp
  end
end

# Given(/^I search for Opportunity by Id$/) do
#   @site = "plist".downcase
#   visit @site, :participate_opp_page
#   on @site, :participate_opp_page do |participate_opp|
#   participate_opp.search_opp
#  end
# end

# When(/^I should see the opportunity details$/) do
#   on @site, :participate_opp_page do |participate_opp|
#  puts participate_opp.opp_details
#   end
# end

# Then(/^I click on Request Loan Package button$/) do
#   on @site, :participate_opp_page do |participate_opp|
#   puts participate_opp.share_opp
#   puts participate_opp.follow_opp
#   participate_opp.participate_opp
#   end
# end

# When(/^I should see the opportunity details$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Then(/^I click on Request Loan Package button$/) do
#   pending # express the regexp above with the code you wish you had
# end


# Then(/^I should be able to see the Documents$/) do
#   pending # express the regexp above with the code you wish you had
# end

# When(/^I click on participate button$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Then(/^I fill the participation (\d+)$/) do |arg1|
#   pending # express the regexp above with the code you wish you had
# end

# Then(/^I click on participate$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Then(/^I should see my reservation$/) do
#   pending # express the regexp above with the code you wish you had
# end
