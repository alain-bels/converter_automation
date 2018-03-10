When(/^I select "([^"]*)" to From list$/) do |value|
  click_by_unit_list_item("radio_group_from", value)
end

And(/^I select "([^"]*)" to To list$/) do |value|
  click_by_unit_list_item("radio_group_to", value)
end