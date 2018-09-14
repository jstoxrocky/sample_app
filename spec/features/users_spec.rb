require 'rails_helper'

RSpec.describe "Users", type: :feature do

  describe "signup" do

    describe "failure" do
      scenario "should not make a new user" do
        expect(lambda do
          visit '/signup'
          fill_in "Name", :with => ""
          fill_in "Email", :with => ""
          fill_in "Password", :with => ""
          fill_in "Confirmation", :with => ""
          click_button
          expect(page).to have_selector("div#error_explanation")
        end).to_not change(User, :count)
      end
    end

    describe "success" do
      scenario "should make a new user" do
        expect(lambda do
          visit '/signup'
          fill_in "Name", :with => "Example User"
          fill_in "Email", :with => "user@example.com"
          fill_in "Password", :with => "foobar"
          fill_in "Confirmation", :with => "foobar"
          click_button
          expect(page).to have_selector("div.flash.success", :text => "Welcome")
        end).to change(User, :count).by(1)
      end
    end

  end
end
