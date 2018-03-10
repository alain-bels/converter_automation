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