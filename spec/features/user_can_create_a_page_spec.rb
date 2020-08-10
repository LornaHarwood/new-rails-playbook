require "rails_helper"

RSpec.feature "User can create a page" do
  context "When a new page form is submitted" do
    scenario "new action displays the page's title and content" do
      User.create(name: "Test User")
      title = "New Page"
      content = "New Page Content"

      visit signin_path

      fill_in "Name", with: "Test User"
      click_button "Sign In"

      within ".top-nav-bar" do
        click_link "Create Page"
      end

      fill_in "Title", with: title
      fill_in "Content", with: content

      click_button "Create Page"

      expect(page).to have_content(title)
      expect(page).to have_content(content)
    end
  end
end
