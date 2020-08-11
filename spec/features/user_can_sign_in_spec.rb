require "rails_helper"

RSpec.feature "If a user has an account they can sign in" do
  context "As a person who has created an account" do
    scenario "I can sign in" do
      User.create(name: "Test User")

      visit signin_path

      expect(page).to have_content("Sign In")
      expect(page).to have_content("Name")

      fill_in "Name", with: "Test User"
      click_button "Sign In"

      expect(page).to have_content("Sign in successful")
      expect(page).to have_content("Create Page")
      expect(page).to have_content("Sign Out")
    end
  end

  context "As a visitor without an account" do
    scenario "I cannot sign in" do
      visit signin_path

      expect(page).to have_content("Sign In")
      expect(page).to have_content("Name")

      fill_in "Name", with: "Test User"
      click_button "Sign In"

      expect(page).to have_content("Name is invalid")
    end
  end
end
