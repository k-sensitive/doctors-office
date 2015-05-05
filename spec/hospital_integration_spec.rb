require('capybara/rspec')
require('spec_helper')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new doctor', {:type => :feature}) do
  it('allows a user to enter in a new doctor') do
    visit('/')
    click_link('Administration')
    click_link('Add New Doctor')
    fill_in('name', :with => 'Phil')
    fill_in('specialty', :with => 'Counseling')
    click_button('Add Doctor')
    expect(page).to have_content('Success')
  end
end
