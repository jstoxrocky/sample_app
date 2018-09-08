require 'rails_helper'

RSpec.describe "LayoutLinks", type: :feature do
  scenario "User visits Home page at /home" do
    visit '/'
    expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
  end

  scenario "User visits About page at /about" do
    visit '/about'
    expect(page).to have_title("Ruby on Rails Tutorial Sample App | About")
  end

  scenario "User visits Contact page at /contact" do
    visit '/contact'
    expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contact")
  end

  scenario "User visits Help page at /help" do
    visit '/help'
    expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
  end

  scenario "User visits Signup page at /signup" do
    visit '/signup'
    expect(page).to have_title("Ruby on Rails Tutorial Sample App | Sign Up")
  end
end
