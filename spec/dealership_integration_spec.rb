require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the index path', {:type => :feature}) do
  it('display the link to see dealership list and link to add new dealership') do
    visit('/')
    expect(page).to have_content("Welcome to Dealership Central")
    click_link('See Dealership List')
    expect(page).to have_content("Here's a list of all our dealerships!")
    visit('/')
    click_link('Add New Dealership')
    expect(page).to have_content("Add dealerships")
  end
end

describe('the dealerships path', {:type => :feature}) do
  it('displays all the dealerships') do
    visit('/dealerships')
    expect(page).to have_content("Here's a list of all our dealerships!")
  end
end

describe('the add dealerships path', {:type => :feature}) do
  it('displays form to add a dealership') do
    visit('/dealerships/new')
    expect(page).to have_content("Add dealerships")
    fill_in('name', :with => "Olivia's Autos")
    click_button('Add Dealership')
    expect(page).to have_content("Dealership added!")
  end
end
