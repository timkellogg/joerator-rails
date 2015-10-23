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
