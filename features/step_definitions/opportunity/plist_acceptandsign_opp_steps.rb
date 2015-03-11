Then(/^I accept reservation and sign agreement$/) do
  # @site = "plist".downcase
  # visit @site, :participate_opp_page
  on @site, :participate_opp_page do |participate_opp|
  puts participate_opp.manage_participants
end
end


Then(/^I click Sign agreement$/) do
on @site, :participate_opp_page do |participate_opp|
puts participate_opp.participant_sign
end
end	

# Then(/^I should accept the participation$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Then(/^I click begin closing process$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Then(/^I click sign agreement$/) do
#   pending # express the regexp above with the code you wish you had
# end
