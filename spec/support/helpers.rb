module SpecHelpers

  def sign_in(user)
      visit(steward_session_path)
      fill_in 'steward[email]', :with => user.email
      fill_in 'steward[password]', :with => 'histewry' # default factory password
      click_button 'enter'
  end

end

RSpec.configure do | config |
  config.include SpecHelpers
end
