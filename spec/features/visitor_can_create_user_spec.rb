require "rails_helper"

RSpec.feature "Anyone using the service can create a user" do
  context "As a person using the playbook" do
    scenario "I can create a new user" do
      visit pages_path

      expect(page).to have_content("Sign Up")

      click_link "Sign Up"

      expect(page).to have_content("Create User")
      expect(page).to have_content("Name")

      fill_in "Name", with: "Test user"
      click_button "Create User"

      expect(page).to have_content("Test user")
    end
  end
end
