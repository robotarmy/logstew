require 'spec_helper'

describe 'Uploading to Log' do
  let(:steward) do
    s = Factory(:steward)
    s.create_address(:public_name => :sam.to_s)
    s
  end

  before(:each) do
    visit(steward_session_path)
    fill_in 'steward[email]', :with => steward.email
    fill_in 'steward[password]', :with => 'histewry'
    click_button 'enter'
  end

  it ' accepts a file attachment ' do
    visit new_steward_log_path(steward)
    attach_file('picture',Rails.root + './public/images/rails.png')
    fill_in 'title', :with => 'Hi'
    click_button "save"
    page.save_and_open_page
  end

end
