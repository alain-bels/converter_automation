def select_menu_item(value)
  current_screen = get_source
  previous_screen = ""
  until menu_item_exists(value) || (current_screen == previous_screen) do
    Appium::TouchAction.new.swipe(
        start_x: 0.5,
        start_y: 0.8,
        offset_x: 0.5,
        offset_y: 0.2,
        duration: 500
    ).perform
    previous_screen = current_screen
    current_screen = get_source
  end

  if menu_item_exists(value)
    find_menu_item(value).click
  else
    fail("Element #{value} was not found in the menu")
  end
end

def find_menu_item(value)
  find_element(id: "design_navigation_view").find_element(xpath: "//android.widget.CheckedTextView[@text='#{value}']")
end

def menu_item_exists(value)
  exists {find_menu_item(value)}
end

def click_by_unit_list_item(list, value)
  unit_item = find_unit_list_item(list, value)
  if exists {unit_item}
    unit_item.click
  else
    fail("No such element #{value} in list #{list}")
  end
end

def find_unit_list_item(list, value)
  find_element(id: list).find_element(xpath: "//android.widget.RadioButton[@text='#{value}']")
end