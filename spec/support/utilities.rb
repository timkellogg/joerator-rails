def log_in(user)
  visit login_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button 'Log in'
end

def log_out
  visit root_path
  click_link 'Log out'
end

def fill_in_coffeeshop_form
  visit new_coffeeshop_path
  fill_in "Name", with: "Example Coffeeshop"
  fill_in "Address", with: "123 Main Street"
  fill_in "City", with: "Faketown"
  select "Alabama", from: "State"
  fill_in "Website", with: "https://examplecoffeeshop.com/"
  fill_in "Opens at", with: "8"
  fill_in "Closes at", with: "8"
  select "casual", from: "Style"
  select "average", from: "How expensive?"
  select "lots", from: "Parking"
  click_button "List shop"
end

def fill_in_item_form
  fill_in "Name", with: "Coffee"
  select "brunch", from: "Dish type?"
  fill_in "Description", with: "A lovely treat"
  fill_in "Price", with: 9
  click_button "Add item"
end

def favorite_coffeeshop(user, coffeeshop)
  coffeeshop.users << user
end
